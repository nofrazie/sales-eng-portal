class IntegrationTypesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @integration_types = IntegrationType.all
  end

  def show
    @integration_type = IntegrationType.find(param[:id])
  end

  def new
    @integration_type = IntegrationType.new
  end

  def create
    @integration_type = IntegrationType.new(integration_type_params)
    if @integration_type.save
      redirect_to integration_types
    else
      render 'new'
    end
  end
end
