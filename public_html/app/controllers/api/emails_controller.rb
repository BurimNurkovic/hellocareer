class Api::EmailsController < ApplicationController
  def subscribe
    respond_to do |format|
      format.js do
        begin
          @message = 'E-mailul tău a fost adăugat cu succes!'
          list_id = Settings.gibbon.newsletter
          Gibbon::Request.new.lists(list_id).members.create(
            body: {:email_address => params[:subscription][:email],
                    :status => 'subscribed'})
        rescue Gibbon::MailChimpError => e
          @message = 'Ooops! Erroare'
          puts e
        end
      end
    end
  end
end
