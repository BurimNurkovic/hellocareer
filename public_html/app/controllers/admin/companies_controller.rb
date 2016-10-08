class Admin::CompaniesController < AdminController
  include RegistrationSubscriber
  def index
    @companies = Company.includes(:subscription).all
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def new

  end

  def create
    @company = Company.create(company_params)
    email = params[:company][:email].downcase
    subscribe(email, Settings.gibbon.companies)
    redirect_to admin_companies_path
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @comany = Company.update_attributes!(company_params)
    redirect_to admin_companies_path
  end

  def destroy
    company = Company.find(params[:id])
    email = company.email
    unsubscribe(email, Settings.gibbon.companies)
    company.destroy
    redirect_to admin_companies_path
  end

  protected

  def company_params
    params.require(:company).permit(:email, :password)
  end
end
