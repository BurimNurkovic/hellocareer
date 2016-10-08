class Admin::BenefitsController < AdminController
  def index
    @benefit = Benefit.new
    @benefits = Benefit.all
  end

  def create
    Benefit.create!(secure_params)
    redirect_to admin_benefits_path
  end

  def edit
    @benefit = Benefit.find(params[:id])
  end

  def update
    Benefit.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_benefits_path
  end

  def destroy
    Benefit.destroy(params[:id])
    redirect_to admin_benefits_path
  end

  private

  def secure_params
    params.require(:benefit).permit(:title, :body)
  end
end
