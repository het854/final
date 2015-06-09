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
france = Country.create(name: "France", is_asean: false)

# Create Bschools
puts "Creating some Business schools"
booth = Bschool.create(name: "Chicago Booth", country_id: usa.id, image: "Booth.jpg", website: "www.chicagobooth.edu")
darden = Bschool.create(name: "Virginia Darden", country_id: usa.id, image: "Darden.jpg", website: "www.darden.virginia.edu")
duke = Bschool.create(name: "Duke Fuqua", country_id: usa.id, image: "Duke.jpg", website: "www.fuqua.duke.edu")
gsb = Bschool.create(name: "Stanford GSB", country_id: usa.id, image: "GSB.jpg", website: "www.gsb.stanford.edu")
hbs = Bschool.create(name: "Harvard Business School", country_id: usa.id, image: "HBS.jpg", website: "www.hbs.edu")
kellogg = Bschool.create(name: "Kellogg", country_id: usa.id, image: "Kellogg.jpg", website: "http://www.kellogg.northwestern.edu")
mit = Bschool.create(name: "MIT Sloan", country_id: usa.id, image: "MIT.jpg", website: "mitsloan.mit.edu")
ross = Bschool.create(name: "Michigan Ross", country_id: usa.id, image: "Ross.jpg", website: "https://michiganross.umich.edu")
wharton = Bschool.create(name: "Wharton", country_id: usa.id, image: "Wharton.jpg", website: "www.wharton.upenn.edu")

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