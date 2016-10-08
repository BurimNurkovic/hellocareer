class Testimonial < ActiveRecord::Base
  mount_uploader :picture, TestimonialPictureUploader
end
