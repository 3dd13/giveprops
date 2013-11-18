User.destroy_all
City.destroy_all
Country.destroy_all
City.destroy_all
Profession.destroy_all

country = Country.create({
	name: "UK"
})

city = City.create({
  name: "London",
  country: country
})

users = User.create([{
  name: "Emily",
  city: city,
  gender: "f",
  email: 'emarnett@ea.com'
},
{ 
	name: "Oliver",
	city: city,
	gender: 'm',
	email: 'oarnett@oa.com'
}])

profession = Profession.create({
	title: "web developer"
	})

props = Props.create([{
		rating: '5',
		profession: profession,
		user: users[0]
	},
	{
	  rating: '1',
		profession: profession,
		user: users[1]
	}])