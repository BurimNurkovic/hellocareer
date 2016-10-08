class ContentBox < ActiveRecord::Base
  mount_uploader :image, ContentBoxImageUploader
end
