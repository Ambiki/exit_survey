class SurveyController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.surveys.create!(survey_param)
    redirect_to see_you_soon_path, notice: "We hope to see you again!"
  end

  private

  def survey_param
    params.require(:survey).permit(:description, :reason, :competitor_url)
  end
end
