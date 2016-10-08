
class Api::QuestionsController < ApplicationController
  def special_data
    sd = Question::Base.where(id: params[:id]).pluck(:special_data).first || {}
    respond_to do |format|
      format.json { render :json => sd }
      format.html { render :json => sd }
    end
  end
end
