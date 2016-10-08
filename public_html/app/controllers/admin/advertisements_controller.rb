class Admin::AdvertisementsController < AdminController
  def index
    @ads = Advertisement.all
  end

  def show
    @ad = Advertisement.find(params[:id])
    render 'advertisements/show', layout: 'application'
  end

  def destroy
    Advertisement.destroy(params[:id])
  end
end
