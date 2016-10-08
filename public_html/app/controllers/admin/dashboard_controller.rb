class Admin::DashboardController < AdminController

  def home_page
    content_boxes = ContentBox.where(:key => [
      'slide_1',
      'slide_2',
      'benefits',
      'how_it_works',
      'call_to_action'
    ])

    @boxes = Hash[content_boxes.map{|item| [item.key, item]}]
  end
end
