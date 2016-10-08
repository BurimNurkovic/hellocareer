class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def update
    current_user.update_attributes(profile_params)

    redirect_to edit_user_registration_path
  end

  private

  def profile_params
    params.require(:user).permit(:full_name, :avatar, :remove_avatar)
  end
end
