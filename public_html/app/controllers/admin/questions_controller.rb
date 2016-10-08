class Admin::QuestionsController < AdminController
  def index
    @questions = Question::Base.order(:order_nr).all.group_by(&:category).to_h
  end

  def new
    @question = Question::Base.new(category: params[:category])
  end

  def create
    Question::Base.create!(question_params)
    flash[:success] = "New Question created!"
    redirect_to admin_questions_path
  end

  def edit
    @question = Question::Base.find(params[:id])
  end

  def update
    @question = Question::Base.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = "Question Updated!"
      redirect_to edit_admin_question_path(@question)
    else
      flash[:error] = "Error!"
      render :edit
    end
  end

  def update_order
    Question::Base.update(questions_params.keys, questions_params.values)
    redirect_to admin_questions_path
  end

  def destroy
    Question::Base.destroy(params[:id])
    redirect_to admin_questions_path
  end

  private

  def question_params
    params.require(:question).permit(
      :builder_text,
      :template_text,
      :key,
      :order_nr,
      :type,
      :category,
      :tip_text,
      :special_data,
      :searchable
    )
  end

  def questions_params
    params.require(:questions).permit!
  end

end
