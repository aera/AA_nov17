class PublishingsController < ApplicationController
  before_action :authenticate_user!

  def create
    q = Question.find params[:question_id]
    if q.publish!
      redirect_to q, notice: 'Question published'
    else
      redirect_to q, alert: 'Can\'t publish question, is it already published?'
    end
  end
end
