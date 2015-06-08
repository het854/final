class Member < ActiveRecord::Base

	require 'csv'   

	validates_presence_of :first_name, :last_name, :bschool_id, :country_id 
	validates :email, presence: true, uniqueness: true
	

	has_many :companies
	belongs_to :bschool
	belongs_to :country
	
	# to do:
	# imports s CSV file (no headers) where 
	# col 0: first_name, col 1: last_name, col 2: gender, col 3: email, col 4: bschool name,  col 5: year_of_graduation
	# col 6: country name, col 7: pre-MBA company name, col 8: MBA internship company name, col 9: post-MBA company name
	# col 10: Pre-MBA Industry, col 11: Pre-MBA function, col 12: Post-MBA Industry Preference, col 13: Post-MBA Function
	# 
	def self.import(file)
		CSV.foreach(file.path) do |row|
			
			#if member already exists in database, then just update instead of creating new
			member = Member.find_or_create_by(first_name: row[0], last_name: row[1] )
			puts "created member"
		   	member.first_name = row[0]
		   	member.last_name = row[1]
		   	member.gender = row[2]
		   	member.email = row[3]
		   	member.bschool_id = Bschool.find_or_create_by(name: row[4]).id
		   	member.year_of_graduation = row[5]
		   	member.country_id = Country.find_or_create_by(name: row[6]).id
		   	
		   	member.pre_mba_company = row[7]
		   	member.mba_internship_company = row[8]
  	 		member.post_mba_company = row[9]
		   	member.pre_mba_industry_id = Industry.find_or_create_by(name: row[10]).id
		   	member.pre_mba_function = row[11]  			
        	member.post_mba_industry_id = Industry.find_or_create_by(name: row[12]).id
  			member.post_mba_function = row[13]
		   	
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


	