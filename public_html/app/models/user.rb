class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :linkedin]

  mount_uploader :avatar, AvatarUploader

  has_many :motivational_letters
  has_many :resumes

  def resumes
    Resume.where(:user_id => id)
  end

  def subscribe(email, list_id)
    gb = Gibbon::Request.new
    hashed_email = Digest::MD5.hexdigest(email.downcase)
    begin
      gb.lists(list_id).members(hashed_email).upsert(body: {email_address: email, status: 'subscribed'})
    rescue Gibbon::MailChimpError => e
      puts e.message
    end
  end

  def self.from_omniauth(auth)
    User.new.subscribe(auth.info.email, Settings.gibbon.users)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.remote_avatar_url = auth.info.image
      user.full_name = auth.info.name
    end
  end

  def views
    views = {}
    self.resumes.each do |r|
      views.merge!(r.id => r.views_count)
    end
    views
  end

  def ad_criteria
    self.resumes.map{|r| r.try(:position).try(:pos_domain_key)}.uniq.compact
  end

  def self.avatar_url_from_oauth(auth)
    case auth.provider
    when 'facebook'
      auth.info.image
    when 'google_oauth2'
      auth.info.image
    else
      nil
    end
  end
end
