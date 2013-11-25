class Users::RegistrationsController < Devise::RegistrationsController
	before_filter :get_cities

	def get_cities
		@cities = City.all
	end
end