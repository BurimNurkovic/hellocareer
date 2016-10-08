class Companies::ProfilesController < CompaniesController
  before_action :authenticate_company!

  def update
    current_company.update_attributes(profile_params)

    redirect_to edit_company_registration_path
  end

  private

  def profile_params
    params.require(:company).permit(:name, :logo, :remove_logo)
  end
end
