class Users::RegistrationsController < Devise::RegistrationsController
  include RegistrationSubscriber

  respond_to :html, :json, :js
  after_filter :subscriber

  def destroy
    respond_to do |format|
      format.js
      format.html { super }
    end
  end

  protected

  def after_sign_up_path_for(resource)
    if params[:devise_remote]
      super
    else
      stored_location_for(resource) || users_dashboard_path
    end
  end

  def subscriber
    if resource.persisted?
      subscribe(resource.email.downcase, Settings.gibbon.users)
    end
  end
end
