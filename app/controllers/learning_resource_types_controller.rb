class LearningResourceTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destoy]

  def index
    @learning_resource_types = LearningResourceType.all
    @learning_resource_type = LearningResourceType.new
  end

  def new
    @learning_resource_type = LearningResourceType.new
  end

  def create
    @learning_resource_type = LearningResourceType.new(learning_resource_type_params)
    respond_to do |format|
      if @learning_resource_type.save
        format.html { redirect_to learning_resource_types, notice: "New learning resource type was successfully created." }
        format.js
        format.json { render json: learning_resource_types, status: :created, location: @learning_resource_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @learning_resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    LearningResourceType.find(params[:id]).destroy
    flash[:success] = "Type Deleted"
    redirect_to learning_resource_types_path
  end

  private
    def learning_resource_type_params
      params.require(:learning_resource_type).permit(:name)
    end

end
