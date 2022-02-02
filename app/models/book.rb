class Book < ApplicationRecord
    belongs_to :author

    has_many :images, as: :imageable
    validates :name, length:{minimum:5}
end
