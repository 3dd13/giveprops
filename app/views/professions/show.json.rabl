collection @professions

attributes :title

node :linked do |profession|
	{
	props: profession_props_url(profession),
  professions: professions_url
  }
end