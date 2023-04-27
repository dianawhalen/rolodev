class CollectionsController < ApplicationController
  before_action :set_collection, only: [:edit, :update, :destroy]
  # def index
  #   if params[:user_id].present?
  #     @user = User.find(params[:user_id])
  #     @collections = @user.collections
  #   else
  #     @collections = current_user.collections
  #   end
  # end

  def index
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @collections = @user.collections
    else
      @collections = Collection.includes(:user).all
    end
  end

  # def index
  #   if params[:my_collections]
  #     @collections = current_user.collections
  #   else
  #     @collections = Collection.all
  #   end
  # end

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

  def add_submission_to_collection
    collection = Collection.find(params[:collection_id])
    submission = Submission.find(params[:submission_id])
    collection.submissions << submission

    redirect_to submission_path(submission), flash[:notice] = "Submission added to collection"
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end
end
