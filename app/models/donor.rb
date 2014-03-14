class Donor < ActiveRecord::Base
	has_many :grants
end
