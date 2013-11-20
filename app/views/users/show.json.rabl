collection @users

attributes :id, :name, :email, :gender

child :city do
  attributes :name
  child :country do
  	attributes :name
  end
end