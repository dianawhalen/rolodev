class CollectionSubmissionsController < ApplicationController
  before_action :set_collection_submission, only: [:destroy]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    if @collection_submission.destroy
      flash[:notice] = "Submission was successfully removed from collection."
    else
      flash[:alert] = "There was an error removing the submission from collection."
    end

    redirect_to collection_path(@collection_submission.collection)
  end

  private

  def set_collection_submission
    @collection_submission = CollectionSubmission.find(params[:id])
  end
end
