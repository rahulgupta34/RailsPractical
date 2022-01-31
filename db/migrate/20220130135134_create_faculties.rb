class CreateFaculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :first_name
      t.string :last_name
      t.integer :mobile
      t.string :email
      t.date :dob
      t.string :designation
      t.boolean :terms_of_usage

      t.timestamps
    end
  end
end
