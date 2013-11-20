class UsersController < ApplicationController
  before_action :get_user, except: [ :index, :create ]
  # before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json

  def index
    if @city = City.find_by_id( params[:city_id] )
      @users = @city.users.all
    else
      @users = User.all
    end
  end

  def show
    @users = [ @user ]
  end

  def create
    if @city = City.find_by_id( params[:city_id] )
      @user = city.users.create(user_params)
    else
      @user = User.create(user_params)
    end
    if @user.save
      head :created, location: user_url(@user)
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      head :no_content
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def destroy
    head( @user.destroy ? :no_content : :method_not_allowed )
  end

  private

  def get_user
    if @city = City.find_by_id( params[:city_id] )
      head :not_found unless @user = @city.users.find_by_id( params[:id] )
    else
      head :not_found unless @user = User.find_by_id( params[:id] )
    end
  end

  def user_params
    params.require(:user).permit( 
      :name, :profile_name
    )
  end
end
