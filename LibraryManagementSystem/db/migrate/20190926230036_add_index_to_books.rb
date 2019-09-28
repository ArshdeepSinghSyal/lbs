class AddIndexToBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :isbn
    add_column :books, :isbn, :string
    add_index :books, :isbn, unique: true
  end
end
