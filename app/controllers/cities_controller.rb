class CitiesController < ApplicationController
  before_action :get_city, except: [ :index, :create ]
  # before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json

  def index
    if @country = Country.find_by_id( params[:country_id] )
      @cities = @country.cities.all
    else
      @cities = City.all
    end
  end

  def show
    @cities = [ @city ]
  end

  def create
    if @country = Country.find_by_id( params[:country_id] )
      @city = @country.cities.create(city_params)
    else
      @city = City.create(city_params)
    end
    if @city.save
      head :created, location: city_url(@city)
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def update
    if @city.update(city_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def destroy
    head( @city.destroy ? :no_content : :method_not_allowed )
  end

  private

  def get_city
    if @country = Country.find_by_id( params[:country_id] )
      head :not_found unless @city = @country.cities.find_by_id( params[:id] )
    else
      head :not_found unless @city = City.find_by_id( params[:id] )
    end
  end

  def city_params
    params.require(:city).permit( 
      :name, :country_id
    )
  end
end
