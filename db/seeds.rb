User.destroy_all
City.destroy_all
Country.destroy_all
Profession.destroy_all

country = Country.create({
	name: "UK"
})

city = City.create({
  name: "London",
  country: country
})

user = User.create!({
  name: "Emily",
  city: city,
  gender: "f",
  email: 'em@ea.com',
  password: '12345678',
  profile_name: 'emily',
  confirmed_at: Time.now

  })

professions = Profession.create([{
		title: "web developer"
	},
	{
		title: 'Actor'
	}])

props = Prop.create([{
		rating: '5',
		profession: professions[0],
		user: user
	},
	{
		rating: '0',
		profession: professions[1],
		user: user
	},
	{
	  rating: '1',
		profession: professions[0],
		user: user
	}])