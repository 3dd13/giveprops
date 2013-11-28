class Users::RegistrationsController < Devise::RegistrationsController
	before_filter :get_cities

	def get_cities
		@cities = City.all
	end

	def edit
		@professions = Profession.all.order("title")
		@user_profession = UserProfessions.where(user: current_user).select("profession_id").first
		if @user_profession
			@profession = @user_profession.profession
		end
	end

	def update
    @user = User.find(current_user.id)

    if params[:profession].blank?
    	if UserProfessions.where(user: @user).exists?
    		u = UserProfessions.where(user: @user).first
    		u.destroy
    	end
    else	
    	if UserProfessions.where(user: @user).exists?
    		u = UserProfessions.where(user: @user).first
    	else
	    	u = UserProfessions.new
	    	u.user = @user
	    	
      end
    	u.profession_id = params[:profession]
    	u.save
    end

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    params[:user][:password].present?
  end

end