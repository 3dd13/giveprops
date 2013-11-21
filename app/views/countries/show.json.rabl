collection @countries

attributes :name

node :href do |country|
  country_url(country)
end

node :linked do |country|
	{
		countries: countries_url,
		country_cities: country_cities_url(country)
	}
end