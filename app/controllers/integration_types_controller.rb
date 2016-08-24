class IntegrationTypesController < ApplicationController
  def index
    @integration_types = IntegrationType.all
  end

  def show
    @integration_type = Integration.find(param[:id])
  end
end
