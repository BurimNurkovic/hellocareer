class ResumesController < ApplicationController
  before_action :authenticate_user!
  append_view_path ResumeTemplate::Resolver.new


include AbstractController::Rendering
  include AbstractController::Helpers
  include AbstractController::Translation
  include AbstractController::AssetPaths
  include Rails.application.routes.url_helpers
  helper ApplicationHelper
  self.view_paths = "app/views"
  attr_reader :html


  def index
    @resumes = current_user.resumes
  end

  def show
    @resume = current_user.resumes.find(params[:id])
    @questions = get_questions
    @templates = Settings.resumes

    respond_to do |format|
      format.js

      format.pdf do
        template = Settings.resumes.send(params[:template_id])
  
        if template_id.to_s== "default"
          render :pdf => "resume",
            :encoding => "utf-8",
            :template => "resumes/show/#{template_id}",
            layout: 'layouts/pdf.pdf.haml',
            #debug as html
            #:show_as_html => params[:debug].present?,
            :dpi => '96',
            :zoom => 1,
            :margin => {:top =>template.top, :bottom => template.bottom, :right => template.right, :left => template.left}
        else
          render :pdf => "resume",
            :encoding => "utf-8",
            :template => "resumes/show/#{template_id}",
            layout: 'layouts/pdf.pdf.haml',
            :dpi => '96',
            :zoom => 1,
            :margin => {:top =>template.top, :bottom => template.bottom, :right => template.right, :left => template.left},

            :header=> {
              :spacing => template.header.spacing,

              :html => {
                 :template => template.header.html.partial,
              }
            },

            :footer => {
              :space => template.footer.spacing,
              :html => {
                 :template => template.footer.html.partial,
              }
            } 
        end
      end
    end
  end

  # def preview
  #   @resume = Resume.new(resume_params)
  #   @questions = get_questions
  #   render :show
  # end

  def new
    if current_user.resumes.count < Settings.max_resumes_per_user
      r = Resume.create_with_associations
      #r = Resume.create
      r.user_id = current_user.id
      r.save!
      redirect_to [:edit, r]
    else
      flash[:alert] = I18n.t 'hc.errors.resumes_too_many'
      redirect_to users_dashboard_path
    end
  end

  def create
    if current_user.resumes.count < Settings.max_resumes_per_user
      r = Resume.create_with_associations
      r.update_attributes!(resume_params)
      r.user_id = current_user.id
      r.save!
      redirect_to r
    else
      flash[:alert] = I18n.t 'hc.errors.resumes_too_many'
      redirect_to users_dashboard_path
    end
  end

  def edit
    @resume = current_user.resumes.find(params[:id])
    @questions = get_questions
  end

  def update
    @resume = current_user.resumes.find(params[:id])
    @resume.update_attributes!(resume_params)

    respond_to do |f|
      f.html { redirect_to users_dashboard_path }
      f.js { flash.now[:notice] = I18n.t 'hc.notices.autosave' }
    end
  end

  def destroy
    Resume.find(params[:id]).destroy
    redirect_to users_dashboard_path
  end

  def destroy_answer_category
    id = params[:id].to_i
    model = params[:model].camelize.singularize
    "Answer::#{model}".constantize.find(id).destroy!
    respond_to do |format|
      format.js { }
    end
  end

  private

  def resume_params
    params.require(:resume).permit!
  end

  def get_questions
    Question::Base.order(:order_nr).all.group_by(&:category).to_h
  end

  def template_id
    params[:template_id] || "default"
  end

  helper_method :template_id
end
