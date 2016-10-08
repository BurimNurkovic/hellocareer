class Admin::SubscriptionsController < AdminController
  def show
    @company = Company.find(params[:company_id])
    @searchable_qkeys = Question::Base.searchable
    @all_qkeys = Question::Base.all
  end

  def update
    c = Company.find(params[:company_id])
    c.subscription.update_attributes!(subscription_params)
    redirect_to admin_company_subscription_path(c)
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :search_limit,
      :premium_points,
      :active,
      :expires_at,
      :searchable_fields => [],
      :visible_fields => []
    )
  end
end
