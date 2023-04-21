class CollectionsController < ApplicationController
  def index
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
  end

  def update
  end

  def destroy
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
