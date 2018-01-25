class SurveysController < ApplicationController
  before_action :authenticate_user!

  def new
    @survey = Survey.new
    4.times { @survey.options.build }
  end

  def create
    survey_params = params.require(:survey).permit(:body,
                                                   { options_attributes: [:body, :id, :_destroy] })
    @survey = Survey.new survey_params
    if @survey.save
      render plain: 'success'
    else
      render :new
    end
  end
end
