class Admin::ResumeTemplatesController < AdminController
  def index
    @resume_templates = ResumeTemplate.select(:id, :handler, :name)
  end

  def show
    @resume_template = ResumeTemplate.find(params[:id])
  end

  def new
    @resume_template = ResumeTemplate.new
  end

  def create
    @resume_template = ResumeTemplate.create!(resume_template_params)
    redirect_to admin_resume_templates_path
  end

  def edit

  end

  def update

  end

  def destroy
    ResumeTemplate.destroy(params[:id])
    redirect_to admin_resume_templates_path
  end

  private

  def resume_template_params
    params.require(:resume_template).permit(:name, :descripiton, :image, :body_for_html, :body_for_pdf, :handler)
  end
end
