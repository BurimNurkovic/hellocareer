class Advertisement < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :company
  has_one :subscription, through: :company

  TYPES = %w(job internship event volunteering)
  DOMAINS = ["Achizitii – Logistica", "Administratie publica", "Agricultura", "Altele", "Arhitectura-design-proiectare", "Asigurari- Banci", "Contabilitate – Finante –Audit", "Servicii clienti – operatori", "Constructii", "Educatie – Training", "Farmacie – Medicina", "Voluntariat – ONG – Project management", "Imobiliare", "Inginerie", "Productie", "IT, Internet", "Juridic", "Management", "Marketing", "Relatii publice", "Media- Jurnalism", "Publicitate – Agentii publicitate", "Resurse umane- Psihologie", "Secretariat – Administrativ", "Telecomunicatii", "Transporturi", "Turism", "Vinzari", "Cultura – Arta", "Freelance", "Limbi straine – Traduceri", "Personal casnic", "Restaurante – Catering", "Sport – Masaj – Infrumusetare", "Paza – Securitate", "Servicii (Mentenanta, Instalatii)"]

  scope :visible, -> {
    where(visible: true, company_id: Subscription.active.pluck(:company_id))
  }

  def self.filter(criteria)
    filtered = []
    unless criteria.empty?
      filtered = where(domain: criteria).sort{|l, r| l.type <=> r.type}
    end
    filtered.empty? ? where(type: 'volunteering') : filtered
  end
end
