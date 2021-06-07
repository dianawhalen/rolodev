class SubmissionsController < ApplicationController
  before_action :redirect_if_not_signed_in

  def index
    # binding.pry
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      # @submissions = @user.submissions
      @submissions = @user.submissions.alpha
    else
      @error = "The user does not exist." if params[:user_id]
      # @submissions = Submission.all
      @submissions = Submission.alpha
    end
  end

  def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @submission = @user.submissions.build
    else
      @submission = Submission.new
    end
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
    @submission = Submission.find_by_id(params[:id])
    redirect_to submissions_path if !@submission
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :url, :notes)
  end
end
