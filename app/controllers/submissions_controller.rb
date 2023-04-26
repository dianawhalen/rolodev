class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:edit, :update, :destroy]
  # def index
  #   @submissions = Submission.includes(:user).all
  # end

  # def index
  #   if params[:user_id]
  #     @submissions = current_user.submissions
  #   else
  #     @submissions = Submission.includes(:user).all
  #   end
  # end

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @submissions = @user.submissions
    else
      @submissions = Submission.includes(:user).all
    end
  end

  # def show
  #   @submission = Submission.find(params[:id])
  #   @upvote = current_user.upvotes.find_by(submission_id: @submission.id)
  #   @collections = current_user.collections
  #   # @collections = Collection.new
  # end

  def show
    @submission = Submission.find(params[:id])
    @upvote = current_user.upvotes.find_by(submission: @submission)
    @collection_submission = CollectionSubmission.new
    @collections = current_user.collections
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
      flash[:notice] = "Submission created!"
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
        flash[:notice] = "Submission deleted."
      else
        flash[:alert] = "There was an error deleting the submission."
      end
    else
      flash[:alert] = "You don't have permission to delete this submission."
    end
    redirect_to submissions_path, data: { confirm: "Are you sure?" }
  end

  # def add_to_collection
  #   collection = Collection.find(params[:collection_submission][:collection_id])
  #   submission = Submission.find(params[:id])
  #   collection.submissions << submission
  #
  #   redirect_to submission_path(submission), notice: "Submission added to collection"
  # end

  def add_to_collection
    collection = Collection.find(collection_submission_params[:collection_id])
    submission = Submission.find(params[:id])
    collection.submissions << submission

    redirect_to submission_path(submission), notice: "Submission added to collection"
  end

  private

  def collection_submission_params
    params.require(:collection_submission).permit(:collection_id)
  end

  def submission_params
    params.require(:submission).permit(:title, :url, :notes, :collection_name, :collection_id)
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end
end
