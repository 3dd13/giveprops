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
  gender: "f"
},
{ 
	name: "Oliver",
	city: city,
	gender: 'm'
}])

professions = Profession.create([{
		title: "web developer"
	},
	{
		title: 'Actor'
	}])

props = Prop.create([{
		rating: '5',
		profession: professions[0],
		user: users[0]
	},
	{
		rating: '0',
		profession: professions[1],
		user: users[0]
	},
	{
	  rating: '1',
		profession: professions[0],
		user: users[1]
	}])