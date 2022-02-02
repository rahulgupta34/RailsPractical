class Faculty < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
    validates :mobile, presence: true, length: { is: 10 }, numericality: true
    validates :dob, comparison: { less_than: Date.today, message: " can't be in future "}, presence: true
    validates :designation, inclusion: { in: %w(Ass_Prof Prof), message: " %{value} sholud be Ass Prof or Prof"}
    validates :terms_of_usage, acceptance: { message: " cannot proceed without accepting Terms of Usage"}

    after_initialize :log_faculty_add_to_db
    after_find :log_faculty_by_id
    after_validation :date_is_validated
    private
    
      def log_faculty_add_to_db
        puts "faculty is added into data base"
      end

      def log_faculty_by_id
        puts "faculty is updated or deleted from the database "
      end
      
      def date_is_validated
        if dob.nil?
            puts "dob is not validated "
        else
            puts "dob is validated "
        end
      end
end
