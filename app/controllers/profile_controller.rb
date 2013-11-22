class ProfileController < ApplicationController

	before_filter :authenticate_user!, only: [:edit, :update, :destroy] 

  def show
  end

end
