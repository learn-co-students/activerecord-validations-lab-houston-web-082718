class Author < ActiveRecord::Base
    validates :name, length: { minimum: 2 }
    validates :phone_number, length: { minimum: 10, maximum: 10 }
    validates :name, uniqueness: true
    validates :phone_number, uniqueness: true
end
