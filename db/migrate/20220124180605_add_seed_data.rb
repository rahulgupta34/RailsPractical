class AddSeedData < ActiveRecord::Migration[7.0]
  def up
    5.times do |i|
      Author.create(first_name: "First Auhhor #{i+1}", last_name: "Second Name #{i+1}", dob: "24/01/2022", email: "abc@gmail.com")
      
    end
  end

  def down
    Author.delete_all
    
  end

end
