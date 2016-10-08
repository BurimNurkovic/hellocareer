class Admin::TeamMembersController < AdminController
  def index
    @team_member = TeamMember.new
    @team_members = TeamMember.all
  end

  def create
    TeamMember.create!(secure_params)
    redirect_to admin_team_members_path
  end

  def edit
    @team_member = TeamMember.find(params[:id])
  end

  def update
    TeamMember.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_team_members_path
  end

  def destroy
    TeamMember.destroy(params[:id])
    redirect_to admin_team_members_path
  end

  private

  def secure_params
    params.require(:team_member).permit(:name, :description, :photo)
  end
end
