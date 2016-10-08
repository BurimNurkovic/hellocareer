class Companies::AdvertisementsController < CompaniesController
  def index
    @ads = current_company.advertisements
  end

  def show
    @ad = current_company.advertisements.find(params[:id])
    render 'advertisements/show', layout: 'application'
  end

  def new
    @ad = Advertisement.new
  end

  def create
    @ad = current_company.advertisements.create(ad_params)
    redirect_to companies_advertisements_path
  end

  def edit
    @ad = current_company.advertisements.find(params[:id])
  end

  def update
    @ad = current_company.advertisements.find(params[:id])
    @ad.update_attributes!(ad_params)
    redirect_to companies_advertisements_path
  end

  def destroy
    current_company.advertisements.destroy(params[:id])
    redirect_to companies_advertisements_path
  end

  private

  def ad_params
    params.require(:advertisement).permit(:title, :body, :type, :deadline, :visible, :domain)
  end
end
