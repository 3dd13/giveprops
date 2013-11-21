collection @cities

attributes :name

child :country do
  attributes :name
  node :href do |country|
  	country_url(country)
	end
end

node :linked do |city|
	{
		cities: cities_url,
		city_users: city_users_url(city)
	}
end

