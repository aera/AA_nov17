class AnswersController < ApplicationController
  before_action :authenticate_user!, :find_question
  # before_action :find_answer, only: [:destroy]
  before_action :find_answer, :authorize_user!, only: [:destroy]

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    # ð alternate to ð provided by `has_many :answers`
    # @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      # AnswerMailer.notify_question_owner(@answer).deliver_now
      # AnswerMailer.notify_question_owner(@answer).deliver_later
      AnswerMailer.notify_question_owner(@answer).deliver_later(wait: 1.minute)
      redirect_to question_path(@question)
    else
      @answers = @question.answers.order(created_at: :desc)
      # We can also give render a string as a first argument. When doing so,
      # we can provide a path beginning from the `/views` directory to
      # template of our choice. Here we're using to render the show
      # template from the questions subdirectory.
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question
    @question = Question.find params[:question_id]
  end

  def find_answer
    @answer = Answer.find params[:id]
  end

  def authorize_user!
    unless can?(:manage, @answer)
      flash[:alert] = "Access Denied!"
      redirect_to home_path
    end
  end
end







## bump
