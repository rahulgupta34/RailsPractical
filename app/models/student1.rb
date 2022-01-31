require "date"
class Student1 < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :phone, presence: true, length: { is: 10 }, numericality: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
    validates :dob, comparison: { less_than: Date.today, message: " can't be in future "}, presence: true
    validates :department, inclusion: { in: %w(IT CE), message: " can't be %{value}" }
end
