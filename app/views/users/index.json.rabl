collection @users

attributes :id, :name, :email, :gender

node :href do |user|
  user_url(user)
end

child :city do
  attributes :name
  child :country do
  	attributes :name
  end
end