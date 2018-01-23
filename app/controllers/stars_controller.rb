class StarsController < ApplicationController
  before_action :authenticate_user!

  def create
    a = Answer.find params[:answer_id]
    star = Star.new(answer: a, user: current_user)
    if !can?(:star, a)
      head :unauthorized
    elsif star.save
      redirect_to a.question, notice: 'Answer starred'
    else
      redirect_to a.question, alert: 'Can\'t star answer'
    end
  end

  def destroy
    star = Star.find params[:id]
    if can?(:destroy, star)
      star.destroy
      redirect_to star.answer.question, notice: 'Answer unstarred'
    else
      head :unauthorized
    end
  end
end
