class SubmissionsController < ApplicationController
  before_action :redirect_if_not_signed_in

  def new
    @submission = Submission.new
  end

  def create
    @submission = current_user.submissions.build(submission_params)
    if @submission.save
      redirect_to submissions_path
    else
      render :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :url, :notes)
  end
end
