class Film < ActiveRecord::Base
	has_many :comments
end
