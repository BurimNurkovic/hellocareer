require 'digest/md5'

module RegistrationSubscriber
  def subscribe(email, list_id)
    gb = Gibbon::Request.new
    hashed_email = Digest::MD5.hexdigest(email.downcase)
    begin
      gb.lists(list_id).members(hashed_email).upsert(body: {email_address: email, status: 'subscribed'})
      flash[:notice] = "Emailul a fost adăugat cu succes!"  
    rescue Gibbon::MailChimpError => e
      flash[:notice] = 'Ooops! Erroare'
      puts e.message
    end
  end

  def unsubscribe(email, list_id)
    gb = Gibbon::Request.new
    hashed_email = Digest::MD5.hexdigest(email.downcase)
    begin
      gb.lists(list_id).members(hashed_email).update(body: {status: "unsubscribed"})
      flash[:notice] = "Emailul a fost eliminat din listă!"
    rescue Gibbon::MailChimpError => e
      flash[:notice] = 'Ooops! Erroare'
      puts e.message
    end
  end
end