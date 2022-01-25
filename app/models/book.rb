class Book < ApplicationRecord
    belongs_to :author
    validates :name, length:{minimum:5}
end
