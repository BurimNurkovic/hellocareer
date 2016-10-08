class Users::SessionsController < Devise::SessionsController
  respond_to :html, :json, :js
  skip_before_filter :verify_authenticity_token, :only => :destroy

  protected

  def after_sign_in_path_for(resource)
    if params[:devise_remote]
      super
    else
      stored_location_for(resource) || users_dashboard_path
    end
  end
end
