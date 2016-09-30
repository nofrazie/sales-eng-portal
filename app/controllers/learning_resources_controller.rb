class LearningResourcesController < ApplicationController
  def index
    @learning_resources = LearningResource.all
  end

  def show
    @learning_resource = LearningResource.find(params[:id])
  end

  def new
    @learning_resource = LearningResource.new
  end

  def create
    @learning_resource = LearningResource.new(learning_resource_params)
    if @learning_resource.save
      redirect_to learning_resources
    else
      render 'new'
    end
  end

  def edit
    @learning_resource = LearningResource.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def learning_resource_params
      params.require(:learning_resource).permit(:title, :link, :type)
    end

end
