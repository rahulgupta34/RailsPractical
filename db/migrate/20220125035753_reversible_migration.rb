class ReversibleMigration < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
         dir.up do
            create_table :tests do |t|
                t.string :test_name

                t.timestamps
            end
        end
         dir.down do
            drop_table :tests
        end
    end
  end
end
