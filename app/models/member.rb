class Member < ActiveRecord::Base

	require 'csv'   

	validates_presence_of :first_name, :last_name, :bschool_id, :country_id 
	validates :email, presence: true, uniqueness: true
	
	belongs_to :bschool
	belongs_to :country
	has_many :employments
	has_many :employers, through: :employments


	# to do:
	# imports s CSV file (no headers) where 
	# col 0: first_name, col 1: last_name, col 2: gender, col 3: email, col 4: bschool name,  col 5: year_of_graduation
	# col 6: country name, col 5: 
	# 
	def self.import(file)
		CSV.foreach(file.path) do |row|
			
			#if member already exists in database, then just update instead of creating new
			member = find_by(first_name: row[0]) && find_by(last_name: row[1] ) || Member.new
			puts "created member"
		   	member.first_name = row[0]
		   	member.last_name = row[1]
		   	member.email = row[2]
		   	member.bschool_id = Bschool.find_or_create_by(name: row[3]).id
		   	member.country_id = Country.find_or_create_by(name: row[4]).id
		   	member.year_of_graduation = row[5]
		   	
		   	member.save!
		  
		   	puts row.inspect
		  
		end
	end

 	# Returns the members whose first or last names contain one or more words that form the query
 	# TO DO: have a parameter that makrs whether the search is strict or loose
  	def self.search(query)
   		# where(:title, query) -> This would return an exact match of the query
   		where("first_name like ? OR last_name like ? ", "%#{query}%", "%#{query}%") 
  	end

end


	