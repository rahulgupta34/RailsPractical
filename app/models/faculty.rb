class Faculty < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
    validates :mobile, presence: true, length: { is: 10 }, numericality: true
    validates :dob, comparison: { less_than: Date.today, message: " can't be in future "}, presence: true
    validates :designation, inclusion: { in: %w(Ass_Prof Prof), message: " %{value} sholud be Ass Prof or Prof"}
    validates :terms_of_usage, acceptance: { message: " cannot proceed without accepting Terms of Usage"}
end
