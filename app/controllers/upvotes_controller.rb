class UpvotesController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:create, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @submission = Submission.find(params[:submission_id])
    @upvote = @submission.upvotes.create(user: current_user)

    if @upvote.save
      flash[:notice] = "Submission upvoted!"
    else
      flash[:alert] = "Unable to upvote submission. Please try again."
    end

    if request.referrer == submissions_url
      redirect_to submissions_url
    else
      redirect_to @submission
    end
  end

  def update
  end

  def destroy
    @submission = Submission.find(params[:submission_id])
    upvote = Upvote.find_by(user_id: current_user.id, submission_id: @submission.id)

    if upvote
      upvote.destroy
      flash[:notice] = "Upvote removed!"
    else
      flash[:alert] = "There was a problem removing your upvote. Please try again."
    end

    if request.referrer == submissions_url
      redirect_to submissions_url
    else
      redirect_to @submission
    end
  end
end
