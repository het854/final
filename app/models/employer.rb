class Employer < ActiveRecord::Base

	belongs_to :country
	has_many :members


end
