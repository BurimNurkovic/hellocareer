class Subscription < ActiveRecord::Base
  belongs_to :company
  scope :active, -> { where active: true }

  def add_premium_resume(r)
    premium_resume_ids << r.id
    decrement!(:premium_points)
  end

  def premium_resumes
    Resume.find_by(id: premium_resume_ids)
  end

  def expiration_date
  	expires_at.nil? ? '' : expires_at.strftime('%d/%m/%Y')
  end

  def expired?
    expires_at? and (expires_at < Date.today) ? true : false
  end
end
