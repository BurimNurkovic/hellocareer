class TeamMember < ActiveRecord::Base
  mount_uploader :photo, TeamMemberPhotoUploader
end
