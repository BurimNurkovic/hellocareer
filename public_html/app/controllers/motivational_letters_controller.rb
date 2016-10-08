class MotivationalLettersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    @ml = current_user.motivational_letters.find(params[:id])
  end

  def new
    @ml = MotivationalLetter.new
  end

  def create
    @ml = current_user.motivational_letters.create!(ml_params)
    redirect_to users_dashboard_path
  end

  def edit
    @ml = current_user.motivational_letters.find(params[:id])
  end

  def update
    @ml = current_user.motivational_letters.find(params[:id])
    @ml.update_attributes!(ml_params)
    redirect_to users_dashboard_path
  end

  def destroy
    ml = current_user.motivational_letters.find(params[:id])
    ml.destroy
    redirect_to users_dashboard_path
  end

  private

  def ml_params
    params.require(:motivational_letter).permit(
      :about,
      :why_position,
      :why_company,
      :offer,
      :benefit,
      :request
    )
  end
end
