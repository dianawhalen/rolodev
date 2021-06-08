class UpvotesController < ApplicationController
   before_action :redirect_if_not_signed_in

  def index
   if params[:submission_id] && @submission = Submission.find_by_id(params[:submission_id])
      @upvotes = @submission.upvotes
   else
     @error = "The submission does not exist." if params[:submission_id]
     @upvotes = Upvote.all
   end
  end

  def new
    if params[:submission_id] && @submission = Submission.find_by_id(params[:submission_id])
      @upvote = @submission.upvotes.build
    else
      @error = "The submission does not exist." if params[:submission_id]
      @upvote = Upvote.new
    end
  end

  def create
    @upvote = current_user.upvotes.build(upvote_params)
    if @upvote.save
      redirect_to upvotes_path
      # redirect_to upvote_path(@upvote)
    else
      render :new
    end
  end

  def show
    @upvote = Upvote.find_by(id: params[:id])
  end

  def edit
    @upvote = Upvote.find_by(id: params[:id])
  end

  def update
    if @upvote.update(upvote_params)
      redirect_to upvote_path(@upvote)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def upvote_params
    params.require(:upvote).permit(:click,:submission_id)
  end
end
