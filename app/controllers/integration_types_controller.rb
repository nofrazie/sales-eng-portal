class IntegrationTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @integration_types = IntegrationType.all
    @integration_type = IntegrationType.new
  end

  def show
    @integration_type = IntegrationType.find(params[:id])
  end

  def new
    @integration_type = IntegrationType.new
  end

  def create
    @integration_type = IntegrationType.new(integration_type_params)
    respond_to do |format|
      if @integration_type.save
        format.html { redirect_to integration_types, notice: "New integration type was successfully created." }
        format.js {}
        format.json { render json: integration_types, status: :created, location: @integration_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @integration_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @integration_type = IntegrationType.find(params[:id])
  end

  def update
    @integration_type = IntegrationType.find(params[:id])
    if @integration_type.update_attributes(integration_type_params)
      flash[:success] = "Integration type updated"
      redirect_to integration_types_path
    else
      render 'edit'
    end
  end

  def destroy
    IntegrationType.find(params[:id]).destroy
    flash[:success] = "Type deleted"
    redirect_to integration_types_path
  end


  private
    def integration_type_params
      params.require(:integration_type).permit(:name)
    end
end
