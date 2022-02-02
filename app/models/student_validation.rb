require "date"
class StudentValidation < ApplicationRecord
    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: " Only Letters Allowed "}
    validates :phone, presence: true, length: { is: 10 }, numericality: true
    validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
    validates :dob, comparison: { less_than: Date.today, message: " can't be in future "}, presence: true
    validates :department, inclusion: { in: %w(IT CE), message: " can't be %{value}" }

    after_initialize :log_student_add_to_db
    after_find :log_student_by_id
    before_validation :validate_dob_before_validation
    after_validation :email_is_validated
    after_create_commit :created_in_db
    set_callback :save, :after, :student_saved_in_db   #running callback method 
    after_destroy :student_is_deleted, if: :check_student_status
    skip_callback :validation, :before, :validate_dob_before_validation, if: :check_validation_status  #skipping callbacks 

    private
     
    def log_student_by_id
      puts "student is updated or deleted from the database "
    end

      def check_student_status
          if StudentValidation.ids.nil?
            puts "student is not fount "
            return false
          else
            def student_is_deleted
              puts "Student is deletd "
              return true
            end
          end
      end
      def log_student_add_to_db
        puts "student is added into data base"
      end

     

      def validate_dob_before_validation
        if dob.nil?
            puts " dob is not validated "
        else
          self.first_name = first_name.strip! unless email.blank? 
            puts " dob is validated "
        end
      end

      def email_is_validated
         if email.blank?
          puts " Email validated "
         end
      end

      def created_in_db
        if email.nil?
          puts "not created in db"
        else
          puts "Created in db "
        end
      end

      def student_saved_in_db
        puts "student is saved in db "
      end

      def check_validation_status
        if false
         return false
        else
         return true
        end
      end

end
