class Film < ActiveRecord::Base
	has_many :comments
	has_many :film_joins
	has_many :users, through: :film_joins
end
