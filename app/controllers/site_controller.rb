class SiteController < ApplicationController

  def index
  	@professions = Profession.all
  	@cities = City.all
  end

end
