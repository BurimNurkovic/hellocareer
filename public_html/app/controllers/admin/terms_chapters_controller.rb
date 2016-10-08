class Admin::TermsChaptersController < AdminController
  def index
    @terms_chapter = TermsChapter.new
    @terms_chapteres = TermsChapter.order(:chapter_nr => :asc).all
  end

  def create
    TermsChapter.create!(secure_params)
    redirect_to admin_terms_chapters_path
  end

  def edit
    @terms_chapter = TermsChapter.find(params[:id])
  end

  def update
    TermsChapter.find(params[:id]).update_attributes!(secure_params)
    redirect_to admin_terms_chapters_path
  end

  def destroy
    TermsChapter.destroy(params[:id])
    redirect_to admin_terms_chapters_path
  end

  private

  def secure_params
    params.require(:terms_chapter).permit(:title, :body, :chapter_nr)
  end
end
