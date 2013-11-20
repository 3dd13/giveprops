class CountriesController < ApplicationController
  before_action :get_country, except: [ :index, :create ]
  # before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json

  def index
    @countries = Country.all
  end

  def show
    @countries = [ @country ]
  end

  def create
    @country = Country.create(country_params)
    
    if @country.save
      head :created, location: country_url(@country)
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def update
    if @country.update(country_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def destroy
    head( @country.destroy ? :no_content : :method_not_allowed )
  end

  private

  def get_country
    head :not_found unless @country = Country.find_by_id( params[:id] )
  end

  def country_params
    params.require(:country).permit( 
      :title
    )
  end
end
