class Author < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
	validates :phone_number, uniqueness: true, presence: true, length: { is: 10 }
end
