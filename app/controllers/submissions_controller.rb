class SubmissionsController < ApplicationController
  before_action :redirect_if_not_signed_in

  def index
    @submissions = Submission.all
  end

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

  def show
    @submission = Submission.find(params[:id])
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :url, :notes)
  end
end
