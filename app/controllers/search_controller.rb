class SearchController < ApplicationController

  def index
  	@professions = Profession.all.order("title")
  	@cities = City.all.order("name")
  	if params[:profession]
  		@profession = Profession.find_by(id: params[:profession])
  		@city = City.find_by(id: params[:city])
  		# @props = Prop.where(profession_id: @profession.id).order("rating")
  		@props = Prop.all_users_by_profession_id(@profession.id).order('total DESC')
      if @city
  		  @users = User.where(city_id: @city.id).where("id IN (?)", @props.map(&:user_id)).to_a
      else
        @users = User.where("id IN (?)", @props.map(&:user_id)).to_a
      end
  	end
  end

  def show
  end

end
