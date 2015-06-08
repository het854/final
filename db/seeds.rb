puts "Deleting all records from the database..."
Member.delete_all
Bschool.delete_all
Country.delete_all
Industry.delete_all
User.delete_all

#Create Countries
puts "Creating some countries..."
usa = Country.create(name: "USA", is_asean: false)
vietnam = Country.create(name: "Vietnam", is_asean: true)
thailand = Country.create( name: "Thailand", is_asean: true)
indonesia = Country.create(name: "Indonesia", is_asean: true)
swiss = Country.create(name: "Switzerland", is_asean: false)
uk = Country.create(name: "United Kingdom", is_asean: false)

# Create Bschools
puts "Creating some Business schools"
booth = Bschool.create(name: "Booth", country_id: usa.id)
kellogg = Bschool.create(name: "Kellogg", country_id: usa.id)
wharton = Bschool.create(name: "Wharton", country_id: usa.id)


#Creates Indusries
puts "Creating some Industries"
consulting = Industry.create(name: "Consulting")
tech =  Industry.create(name: "Tech")
banking = Industry.create(name: "Banking")
cpg = Industry.create(name: "CPG")

# Create some members
puts "Creating some members"
AnhLe = Member.create(first_name: "Anh", last_name: "Le", email: "ale2015@kellogg.northwestern.edu", bschool_id: kellogg.id, country_id: vietnam.id)	
SheilaSumantri = Member.create( first_name:	"Sheila", last_name: "Sumantri", email:	"sumantri@wharton.upenn.edu", bschool_id: wharton.id, country_id: indonesia.id)
NapolChaisilwattana	= Member.create( first_name: "Napol", last_name: "Chaisilwattana", email: "napol@wharton.upenn.edu",	bschool_id: wharton.id, country_id:	thailand.id)
FionaHandayani = Member.create(first_name: "Fiona", last_name: "Handayani", email: "fionahandayani@gmail.com", bschool_id: kellogg.id, 	country_id: indonesia.id)
NikhailSingh = Member.create(first_name: "Nikhail", last_name: "Singh", email: "nsingh2015@kellogg.northwestern.edu", bschool_id: kellogg.id, country_id: usa.id)	


# Create users
User.create(name: "Admin1", email: "admin1@kellogg.northwestern.edu", password: "admin1", admin: true)
User.create(name: "User1", email: "user1@gmail.com", password: "user1", admin: false)