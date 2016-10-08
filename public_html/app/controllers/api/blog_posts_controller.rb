class Api::BlogPostsController < ApplicationController
  def recent
    render json: Connectors::Blog.new.get_recent_posts
  end
end
