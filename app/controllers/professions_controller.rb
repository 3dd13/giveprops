class ProfessionsController < ApplicationController
  before_action :get_profession, except: [ :index, :create ]
  # before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json

  def index
    @professions = Profession.all
  end

  def show
    @professions = [ @profession ]
  end

  def create
    @profession = Profession.create(profession_params)
    
    if @profession.save
      head :created, location: profession_url(@profession)
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def update
    if @profession.update(profession_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def destroy
    head( @profession.destroy ? :no_content : :method_not_allowed )
  end

  private

  def get_profession
    head :not_found unless @profession = Profession.find_by_id( params[:id] )
  end

  def profession_params
    params.require(:profession).permit( 
      :title
    )
  end
end
