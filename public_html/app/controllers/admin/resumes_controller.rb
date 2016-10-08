class Admin::ResumesController < AdminController
  def index
    @questions = Question::Base.searchable
  end

  def show
    @questions = Question::Base.order(:order_nr).all.group_by(&:category).to_h
    @resume = Resume.find(params[:id])
  end

  def search
    @questions = Question::Base.searchable
    if sq = search_params
      @resumes = Resume.search(sq, nil)
    end
    render :index
  end

  private

  def search_params
    params[:search_query].select{ |k, v| v.present? } if params[:search_query].present?
  end
end
