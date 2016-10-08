class Admin::PartnersController < AdminController
  def index
    @partner = Partner.new
    @partners = Partner.all
  end

  def create
    Partner.create!(secure_params)
    redirect_to admin_partners_path
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    Partner.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_partners_path
  end

  def destroy
    Partner.destroy(params[:id])
    redirect_to admin_partners_path
  end

  private

  def secure_params
    params.require(:partner).permit(:name, :logo)
  end
end
