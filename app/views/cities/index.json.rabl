collection @cities

attributes :name

child :country do
  attributes :name
  node :href do |country|
  	country_url(country)
	end
end

node :href do |city|
  city_url(city)
end

node :linked do |city|
	{
		city_users: city_users_url(city)
	}
end