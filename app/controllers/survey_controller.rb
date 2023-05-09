class SurveyController < ApplicationController
  before_action :authenticate_user!

  # If a user re-subscribes within the grace period, we don't want to process the job.
  GRACE_PERIOD = 1.week

  def create
    current_user.surveys.create(survey_param)
    current_user.stop_active_subscriptions
    SeeYouSoonJob.set(wait: GRACE_PERIOD).perform_later(current_user)

    redirect_to see_you_soon_path, notice: "We hope to see you again!"
  end

  private

  def survey_param
    params.require(:survey).permit(:description, :reason, :competitor_url)
  end
end
