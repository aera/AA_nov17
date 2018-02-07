class MyQuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = current_user.questions
  end
end
