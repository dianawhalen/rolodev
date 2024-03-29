class CollectionsController < ApplicationController
  before_action :set_collection, only: [:edit, :update, :destroy]
  before_action :set_collection_submission, only: [:destroy]
  before_action :require_owner, only: [:show, :edit, :update, :destroy]

  def index
    @collections = current_user.collections
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      flash[:notice] = "Collection was successfully created."
      redirect_to @collection
    else
      flash[:alert] = "Unable to create collection. Please try again."
      render :new
    end
  end

  def show
    @collection = Collection.find(params[:id])
    @submissions = @collection.submissions.order(created_at: :desc)
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update(collection_params)
      redirect_to @collection
    else
      render 'edit'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    if @collection.user == current_user
      if @collection.destroy
        flash[:notice] = "Collection deleted."
      else
        flash[:alert] = "There was an error deleting the collection."
      end
    else
      flash[:alert] = "You don't have permission to delete this collection."
    end
    redirect_to collections_path, data: { confirm: "Are you sure?" }
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def set_collection_submission
    @collection_submission = @collection.collection_submissions.find(params[:id])
  end

  def require_owner
    @collection = Collection.find_by(id: params[:id])
    unless @collection && current_user == @collection.user
      flash[:alert] = "You do not have permission to access this collection."
      redirect_back(fallback_location: collections_path)
    end
  end
end
