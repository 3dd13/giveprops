class ProfileController < ApplicationController

	before_filter :authenticate_user!, only: [:edit, :update, :destroy] 

  def show
  	@user_profile = User.where('profile_name= ?', params[:profile_name]).take
    @props = Prop.all_professions_by_user_id(@user_profile.id)
    @current_user_ratings_for_this_user = Prop.where(user: @user_profile, rated_by_user: current_user)
  end

  def update
  	@user_profile = User.where('profile_name= ?', params[:profile_name]).take
  	if params[:delete_avatar]
      #delete avatar
      @user_profile.remove_avatar!
      @user_profile.save
  	end
  	if params[:save_avatar]
      @user_profile.avatar = params[:user][:avatar]
      @user_profile.update(user_params)
    end
    redirect_to profile_url
  end

private
	def user_params
    params.require(:user).permit(
      :avatar
    )
  end
end
