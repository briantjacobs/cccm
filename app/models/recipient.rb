class Recipient < ActiveRecord::Base
	has_many :grants
end
