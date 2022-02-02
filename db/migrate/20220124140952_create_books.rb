class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price, precision: 4, scale: 2

      t.timestamps
    end
  end
end
