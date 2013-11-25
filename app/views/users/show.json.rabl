object nil

child @users, object_root: false do

	attributes :id, :name, :email, :gender, :profile_name

	child :city do
	  attributes :name
	  child :country do
	  	attributes :name
	  end
	end

	node :linked do |user|
		{
			users: users_url,
			props: user_props_url(user)
		}
	end
end