collection @prop

attributes :rating

child :profession do
  attributes :title
  node :href do |profession|
		profession_url(profession)
	end
	node :linked do |profession|
		{
			profession_props: profession_props_url(profession)
		}
	end
end

child :user do
  attributes :name
  node :href do |user|
		user_url(user)
	end
	node :linked do |user|
	{
		user_props: user_props_url(user)
	}
	end
end

node :linked do |prop|
	{
		props: props_url
	}
end
