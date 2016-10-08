module HomeHelper
  def page_title
    content_for(:title) || 'HelloCareer'
  end

  def facebook_share_tags
    content_for(:facebook_share_data) || fb_share_tags
  end

  def facebook_share_options(options)
    content_for(:facebook_share_data, fb_share_tags(options))
  end

  protected

  def fb_share_tags(options = {})
    options = facebook_share_defaults.merge(options)
    tag('meta', property: 'og:url', content: options[:url]) +
    tag('meta', property: 'og:type', content: options[:type]) +
    tag('meta', property: 'og:title', content: options[:title]) +
    tag('meta', property: 'og:descripiton', content: options[:description]) +
    tag('meta', property: 'og:image', content: options[:image_url]) +
    (tag('meta', property: 'og:image:width', content: options[:image_width]) if options[:image_width]) +
    (tag('meta', property: 'og:image:height', content: options[:image_height]) if options[:image_height])
  end

  def facebook_share_defaults
    {
      url: 'http://hellocareer.md',
      type: 'website',
      title: page_title,
      description: 'Prima platformă locală care te ajută să-ți creezi gratis, rapid și fără bătaie de cap un CV exact așa cum vor să-l vadă angajatorii.',
      image_url: image_url('facebook_share/main.png')
    }
  end
end
