class SiteController < ApplicationController

  def index
  	@professions = Profession.all.order("title")
  	@cities = City.all.order("name")
  end

end
