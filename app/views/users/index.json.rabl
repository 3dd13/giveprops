object nil

child @users, object_root: false do

  attributes :id, :name, :email, :gender, :profile_name

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

  node :links do |user|
  	{
  		props: user_props_url(user)
  	}
  end

end