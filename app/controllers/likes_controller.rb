class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    q = Question.find params[:question_id]
    if can? :like, q
      like = Like.new(question: q, user: current_user)
      if like.save
        # redirect_to question_path(q), notice: 'Liked'
        redirect_to q, notice: 'Liked'
      else
        redirect_to q, alert: 'Couldn\'t like'
      end
    else
      # head will send an empty HTTP response with a code corresponding to the
      # symbol you provide. In this case :unauthorized is code 401
      head :unauthorized
    end
  end

  def destroy
    like = Like.find params[:id]
    if can? :destroy, like
      like.destroy
      redirect_to question_path(like.question), notice: 'Like removed'
    else
      head :unauthorized
    end
  end
end
