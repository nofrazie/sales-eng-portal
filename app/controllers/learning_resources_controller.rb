class LearningResourcesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]

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
    @learning_resource = current_user.learning_resources.build(learning_resource_params)
    if @learning_resource.save
      flash[:info] = "You have successfully created a new Learning Resource."
      redirect_to learning_resource_path(@learning_resource)
    else
      render 'new'
    end
  end

  def edit
    @learning_resource = LearningResource.find(params[:id])
  end

  def update
    @learning_resource = LearningResource.find(params[:id])
    if @learning_resource.update_attributes(learning_resource_params)
      flash[:success] = "Learning resource updated!"
      redirect_to @learning_resource
    else
      render 'edit'
    end
  end

  def destroy
    @learning_resource.destroy
    flash[:success] = "Learning resource deleted"
    redirect_to learning_resources
  end

  private

    def learning_resource_params
      params.require(:learning_resource).permit(:title, :link, :learning_resource_type_id)
    end

    def correct_user
      @learning_resource = current_user.learning_resources.find_by(id: params[:id])
      redirect_to root_url if @learning_resource.nil?
    end

end
