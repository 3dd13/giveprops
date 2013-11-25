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
		child :city do
    attributes :name
    node :href do |city|
    	city_url(city)
  	end
    child :country do
    	attributes :name
    	node :href do |country|
    		country_url(country)
  		end
    end
  end
	end

end



