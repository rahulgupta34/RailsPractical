class AddSeedDataBack < ActiveRecord::Migration[7.0]
  def up
    5.times do |i|
      Book.create(name: "book #{i+1}", price: 2,4)
    end
  end

  def down
      Book.delete_all
  end

end
