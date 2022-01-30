class Author < ApplicationRecord
    has_many :books, dependent: :destroy
   
    has_many :images, as: :imageable
    validates :first_name, presence: true, length: {minimum: 5, message: " length should be at least 5 character "}
    validates :last_name, presence: true, length:{minimum: 7, message: " length should be at least 7 character "}
    validates :dob, presence: true
    validates :email, presence: true
end
