puts "Deleting all records from the database..."
Member.delete_all
Bschool.delete_all
Country.delete_all
Employer.delete_all

#Create Countries
puts "Creating some countries..."
usa = Country.create(name: "USA", is_asean: false)
vietnam = Country.create(name: "Vietnam", is_asean: true)
thailand = Country.create( name: "Thailand", is_asean: true)
indonesia = Country.create(name: "Indonesia", is_asean: true)

# Create Bschools
puts "Creating some Business schools"
booth = Bschool.create(name: "Booth", country_id: usa.id)
kellogg = Bschool.create(name: "Kellogg", country_id: usa.id)
wharton = Bschool.create(name: "Wharton", country_id: usa.id)


# Create some members
puts "Creating some members"
AnhLe = Member.create(first_name: "Anh", last_name: "Le", email: "ale2015@kellogg.northwestern.edu", bschool_id: kellogg.id, country_id: vietnam.id)	
SheilaSumantri = Member.create( first_name:	"Sheila", last_name: "Sumantri", email:	"sumantri@wharton.upenn.edu", bschool_id: wharton.id, country_id: indonesia.id)
NapolChaisilwattana	= Member.create( first_name: "Napol", last_name: "Chaisilwattana", email: "napol@wharton.upenn.edu",	bschool_id: wharton.id, country_id:	thailand.id)
FionaHandayani = Member.create(first_name: "Fiona", last_name: "Handayani", email: "fionahandayani@gmail.com", bschool_id: kellogg.id, 	country_id: indonesia.id)
NikhailSingh = Member.create(first_name: "Nikhail", last_name: "Singh", email: "nsingh2015@kellogg.northwestern.edu", bschool_id: kellogg.id, country_id: usa.id)	


# Create users
User.create(name: "Evelyn", email: "htay2015@kellogg.northwestern.edu", password: "secret", admin: true)
User.create(name: "Joe", email: "joeuser@gmail.com", password: "1234", admin: false)