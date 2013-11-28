class ProfileController < ApplicationController

	before_filter :authenticate_user!, only: [:edit, :update, :destroy] 

  def show
  	@user_profile = User.where('profile_name= ?', params[:profile_name]).take
    @user_professions = UserProfessions.where('user_id= ?', @user_profile).first
    @props = Prop.all_professions_by_user_id(@user_profile.id)
    @current_user_ratings_for_this_user = Prop.where(user: @user_profile, rated_by_user: current_user).first
    @images = Image.where(user: @user_profile)
  end

  def update
  	@user_profile = User.where('profile_name= ?', params[:profile_name]).take
  	if params[:delete_avatar]
      @user_profile.remove_avatar!
      @user_profile.save
  	elsif params[:save_avatar]
      @user_profile.avatar = params[:user][:avatar]
      @user_profile.update(user_params)
    end
    puts "update"
    if params[:save_portfolio_image]
      puts "save_portfolio_image"
      @image = Image.new(image_params)
      @image.user = current_user
      result = @image.save

      puts "complete"
      puts result
      puts @image.errors.inspect
      puts @image.inspect
      
    end
    redirect_to profile_url
  end

private
	def user_params
    params.require(:user).permit(
      :avatar
    )
  end

  def image_params
    params.require(:images).permit(
      :portfolio_image
    )
  end
end
