class Connectors::Blog
  RecentPost = Struct.new(:title, :url)
  def get_recent_posts
    response = HTTParty.get("http://#{Settings.blog}/?json=get_recent_posts")
    unless response.fetch("posts", []).is_a? String
      posts = response.fetch("posts", []).take(8) 

      posts.map do |p|
        RecentPost.new(p["title"], p["url"])
      end
    end
  end
end
