class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    q = Question.find params[:question_id]
    vote = Vote.new(user: current_user, question: q, is_up: params[:is_up])
    if vote.save
      redirect_to q, notice: 'Thanks for voting'
    else
      redirect_to q, alert: 'Could not vote!'
    end
  end

  def update
    vote = Vote.find params[:id]
    vote.update({ is_up: params[:is_up] })
    redirect_to vote.question, notice: 'Vote changed'
  end

  def destroy
    vote = Vote.find params[:id]
    vote.destroy
    redirect_to vote.question, notice: 'Vote removed'
  end
end
