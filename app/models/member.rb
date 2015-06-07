class Member < ActiveRecord::Base

	require 'csv'   

	validates_presence_of :first_name, :last_name, :bschool_id
	
	belongs_to :bschool
	belongs_to :country
	has_many :employments
	has_many :employers, through: :employments

	def accessible_attributes
		[first_name, last_name, bschool_id]
	end


	def self.import(file)
		CSV.foreach(file.path) do |row|
			
			puts "ok"
			
			#if member already exists in database, then just update instead of creating new
			member = find_by(first_name: row[0]) || Member.new
			puts "created member"
		   	member.first_name = row[0]
		   	member.last_name = row[1]
		   	member.email = row[2]
		   	member.bschool_id = Bschool.find_or_create_by(name: row[3]).id
		   	member.country_id = Country.find_or_create_by(name: row[4]).id
		   	member.year_of_graduation = row[5]
		   	
			#member.attributes = row.to_hash.slice(*accessible_attributes)
		   	member.save!
		  
		   	puts row.inspect
		  
		end
	end
end


	