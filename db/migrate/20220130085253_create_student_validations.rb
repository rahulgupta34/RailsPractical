class CreateStudentValidations < ActiveRecord::Migration[7.0]
  def change
    create_table :student_validations do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.date :dob
      t.string :department

      t.timestamps
    end
  end
end
