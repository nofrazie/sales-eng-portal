class IntegrationsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: :destroy

  def index
    @integrations = Integration.all
  end

  def show
    @integration = Integration.find(params[:id])
  end

  def new
    @integration = Integration.new
  end

  def create
    @integration = Integration.new(integration_params)
    if @integration.save
      flash[:info] = "You have successfully created a new Integration."
      redirect_to integration_path(@integration)
    else
      render 'new'
    end
  end

  def edit
    @integration = Integration.find(params[:id])
  end

  def update
    @integration = Integration.find(params[:id])
    if @integration.update_attributes(integration_params)
      flash[:success] = "Integration updated"
      redirect_to @integration
    else
      render 'edit'
    end
  end

  def destroy
    Integration.find(params[:id]).destroy
    flash[:success] = "Integration deleted"
    redirect_to integrations
  end

  private
    def integration_params
      params.require(:integration).permit(:name, :integration_type_id, :description, :built_by, :status, :summary, :picture)
    end
end
