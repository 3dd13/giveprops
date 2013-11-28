require 'freebase_client'

namespace :freebase do
  desc "Download people data from Freebase"
  task :download => :environment do
		# FreebaseClient.all_cities.each do |uk|
  #   	uk["/location/location/contains"].each do |city|
  #   		City.create(name: city["name"], country_id: 1)
  #   	end
  #   end
  #   FreebaseClient.all_professions.each do |p|
  #   	Profession.create(title: p["name"])
  #   end
  end
end