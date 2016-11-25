class LearningResourcesController < ApplicationController
  before_action :set_learning_resource, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @learning_resources = LearningResource.all.order(sort_column + " " + sort_direction)
    @learning_resource = current_user.learning_resources.build
  end

  def show
  end

  def new
    # @learning_resource = current_user.learning_resources.build
  end

  def create
    @learning_resource = current_user.learning_resources.build(learning_resource_params)

    respond_to do |format|
      if @learning_resource.save
        format.html { redirect_to learning_resource_path(@learning_resource), info: "You have successfully created a new Learning Resource." }
        format.json { render :show, status: :created, location: @learning_resource }
        format.js
      else
        format.html { render :new }
        format.json { render json: @learning_resource.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
  end

  def update
    if @learning_resource.update_attributes(learning_resource_params)
      flash[:success] = "Learning resource updated!"
      redirect_to @learning_resource
    else
      render 'edit'
    end
  end

  def destroy
    @learning_resource.destroy
    respond_to do |format|
      format.html { redirect_to learning_resources_path, notice: "Learning resource was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def upvote
    @learning_resource.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @learning_resource.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_learning_resource
      @learning_resource = LearningResource.find(params[:id])
    end

    def learning_resource_params
      params.require(:learning_resource).permit(:title, :link, :learning_resource_type_id)
    end

    def correct_user
      @learning_resource = current_user.learning_resources.find_by(id: params[:id])
      redirect_to root_url if @learning_resource.nil?
    end

    def sort_column
      LearningResource.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
