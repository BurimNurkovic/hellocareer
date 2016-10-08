class CompaniesController < ApplicationController
  before_action :authenticate_company!
  before_action :check_subscription

  protected

  def check_subscription
    if not current_company.subscription.active?
      flash[:alert] = 'Subscription not active!'
      redirect_to root_path
    elsif current_company.subscription.expired?
      flash[:alert] = 'Subscription expired!'
      redirect_to root_path
    end
  end
end
