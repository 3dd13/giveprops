class PropsController < ApplicationController
  before_action :get_prop, except: [ :index, :create, :update ]
  # before_action :set_csrf_token_header, only: [ :index, :show ]
  
  respond_to :json

  def index
    if params[:user_id]
      @props = Prop.where(user_id: params[:user_id])
    elsif params[:profession_id]
      @props = Prop.where(profession_id: params[:profession_id])
    else
      @props = Prop.all
    end
  end

  def show
    @props = [ @prop ]
  end

  def create
    if @user = User.find_by_id( params[:user_id] )
      @prop = @user.props.create(rating: params[:rating], user_id: params[:user_id], profession_id: params[:profession_id], rated_by_user_id: params[:rated_by_user_id])
    elsif @profession = Profession.find_by_id( params[:profession_id] )
      @props = @profession.props.create(prop_params)
    else
      @prop = Prop.create(rating: params[:rating], user_id: params[:user], profession_id: params[:profession], rated_by_user_id: params[:rated_by_user])
    end

    if @prop.save
      head :created, location: prop_url(@prop)
      redirect_to profile_path(@prop.user_id)
    else
      render 'errors', status: :unprocessable_entity
    end
  end

  def update
    # if @prop.update_attributes(rating: params[:rating])
    #   head :no_content
    #   # redirect_to profile_path(@prop.user_id)
    # elsif @prop.update(prop_params)
    #   head :no_content
    # else
    #   render 'errors', status: :unprocessable_entity
    # end
    @prop = Prop.find_by_id(params[:id])
    @prop.update_attributes(rating: params[:rating])
    head :no_content
  end

  def destroy
    head( @prop.destroy ? :no_content : :method_not_allowed )
  end

  private

  def get_prop
    if @user = User.find_by_id( params[:user_id] )
      head :not_found unless @prop = @user.props.find_by_id( params[:id] )
    elsif @profession = Profession.find_by_id( params[:profession_id] )
      head :not_found unless @prop = @profession.props.find_by_id( params[:id] )
    else
      head :not_found unless @prop = Prop.find_by_id( params[:id] )
    end
  end

  def prop_params
    params.require(:prop).permit( 
      :rating, :user_id, :profession_id, :rated_by_user_id
    )
  end
end
