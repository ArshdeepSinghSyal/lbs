class CreateLibBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :lib_books do |t|
      t.references :library, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
