class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = current_user.submissions.build
    @submission.attributes = submission_params if params[:submission]
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def create
    @submission = current_user.submissions.build(submission_params)

    if @submission.save
      flash[:success] = "Submission created!"
      redirect_to @submission
    else
      flash[:alert] = "Invalid URL format. Please enter a valid URL."
      redirect_to new_submission_path(submission: @submission.attributes)
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to @submission
    else
      render 'edit'
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    if @submission.user == current_user
      if @submission.destroy
        flash[:success] = "Submission deleted."
      else
        flash[:alert] = "There was an error deleting the submission."
      end
    else
      flash[:alert] = "You don't have permission to delete this submission."
    end
    redirect_to submissions_path, data: { confirm: "Are you sure?" }
  end

  private

  def submission_params
    params.require(:submission).permit(:title, :url, :notes)
  end
end
