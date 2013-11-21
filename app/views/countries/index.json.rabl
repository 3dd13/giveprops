collection @countries

attributes :name

node :href do |country|
  country_url(country)
end

node :linked do |country|
	{
		country_cities: country_cities_url(country)
	}
end