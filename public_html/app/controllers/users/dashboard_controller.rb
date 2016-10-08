class Users::DashboardController < ApplicationController

  before_action :authenticate_user!

  def index
    @resumes = current_user.resumes.limit(3)
    @mls = current_user.motivational_letters
    @ads = Advertisement.visible.filter(current_user.ad_criteria)    
  end
end
