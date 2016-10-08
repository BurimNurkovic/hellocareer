class AdvertisementsController < ApplicationController
  before_action :authenticate_user!

  def show
    @ad = Advertisement.visible.includes(:company).find(params[:id])
    @ad.increment!(:views)
  end

  def index
    @ads = Advertisement.visible.includes(:company)
  end
end
