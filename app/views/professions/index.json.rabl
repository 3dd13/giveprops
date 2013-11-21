collection @professions

attributes :title

node :href do |profession|
  profession_url(profession)
end

node :linked do |profession|
	{
		props: profession_props_url(profession)
	}
end