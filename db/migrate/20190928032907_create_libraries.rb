class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.references :university, foreign_key: true
      t.string :location
      t.string :name
      t.string :location
      t.integer :max_days

      t.timestamps
    end
  end
end
