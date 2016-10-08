class HomeController < ApplicationController
  def index
    @content_boxes = content_boxes_for(:slide1, :slide2, :home_benefits, :home_testimonials, :home_calltoaction, :home_partners, :home_how, :home_how_1, :home_how_2, :home_how_3)
    @benefits = Benefit.all
    @testimonials = Testimonial.all
    @partners = Partner.all
  end

  def terms
    @terms_chapters = TermsChapter.order(:chapter_nr)
  end

  def about
    @content_boxes = content_boxes_for(:about_msg, :about1, :about2, :about_team, :about_video, :about_images)
    @team_members = TeamMember.all
  end

  def render_navbar
    respond_to do |format|
      format.js
    end
  end

  private

  def content_boxes_for(*args)
    ContentBox.where(
      :key => args
    ).map{|cb| [cb.key, cb]}.to_h
  end
end
