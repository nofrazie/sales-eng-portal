class IntegrationsController < ApplicationController
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
      redirect_to integration_path(@integration)
    else
      render 'new'
    end
  end

  private
    def integration_params
      params.require(:integration).permit(:name, :integration_type_id, :description, :built_by, :status, :summary)
    end
end
