class LearningResourceCommentsController < ApplicationController
  before_action :set_learning_resource_comment, only: [:show, :edit, :update, :destroy]

  # GET /learning_resource_comments
  # GET /learning_resource_comments.json
  def index
    @learning_resource_comments = LearningResourceComment.all
  end

  # GET /learning_resource_comments/1
  # GET /learning_resource_comments/1.json
  def show
  end

  # GET /learning_resource_comments/new
  def new
    @learning_resource_comment = LearningResourceComment.new
  end

  # GET /learning_resource_comments/1/edit
  def edit
  end

  # POST /learning_resource_comments
  # POST /learning_resource_comments.json
  def create
    @learning_resource_comment = LearningResourceComment.new(learning_resource_comment_params)

    respond_to do |format|
      if @learning_resource_comment.save
        format.html { redirect_to @learning_resource_comment, notice: 'Learning resource comment was successfully created.' }
        format.json { render :show, status: :created, location: @learning_resource_comment }
      else
        format.html { render :new }
        format.json { render json: @learning_resource_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_resource_comments/1
  # PATCH/PUT /learning_resource_comments/1.json
  def update
    respond_to do |format|
      if @learning_resource_comment.update(learning_resource_comment_params)
        format.html { redirect_to @learning_resource_comment, notice: 'Learning resource comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_resource_comment }
      else
        format.html { render :edit }
        format.json { render json: @learning_resource_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_resource_comments/1
  # DELETE /learning_resource_comments/1.json
  def destroy
    @learning_resource_comment.destroy
    respond_to do |format|
      format.html { redirect_to learning_resource_comments_url, notice: 'Learning resource comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_resource_comment
      @learning_resource_comment = LearningResourceComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_resource_comment_params
      params.require(:learning_resource_comment).permit(:learning_resource_id, :body, :user_id)
    end
end
