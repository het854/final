class Member < ActiveRecord::Base

	belongs_to :bschool
	belongs_to :country
	has_many :employments
	has_many :employers, through: :employments


	
	def accessible_attributes
 		[first_name, last_name, bschool_id, email]
	end

	#validates_presence_of :first_name, :last_name, :bschool_id, :email, :gender


	def self.import(file)
	 	CSV.foreach(file.path, headers: true) do |row|
	    member = find_by_id(row["id"]) || new
	    member.attributes = row.to_hash.slice(*accessible_attributes)
	    member.save!
	  end
	end

end


	