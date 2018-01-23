# module Api
#   module V1
#     class QuestionsController < ApplicationController
#     end
#   end
# end
# /api/v1/questions

class Api::V1::QuestionsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:show]
  
  def show
    # Test to see if current_user works
    # return render json: current_user
    render json: @question
  end

  def index
    @questions = Question.order(created_at: :desc)
    # When using jbuilder, do not use the `json:`
    # option with render. Use render as you would with erb
    # templates.
    # render json: @questions
  end

  def create
    question = Question.new(question_params)
    question.user = current_user
    if question.save
      render json: { id: question.id }
    else
      render json: { error: question.errors.full_messages }
    end
  end

  def destroy
    if @question.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private
  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
