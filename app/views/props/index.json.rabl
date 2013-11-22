object nil

child @props, object_root: false do

	attributes :rating

	node :href do |prop|
	  prop_url(prop)
	end

	child :profession do
	  attributes :title
	  node :href do |profession|
			profession_url(profession)
		end
	end

	child :user do
	  attributes :name
	  node :href do |user|
			user_url(user)
		end
	end

end



