class AddMaxBooksToUniversities < ActiveRecord::Migration[5.2]
  def change
    add_column :universities, :ug_books_limit, :integer
    add_column :universities, :grad_books_limit, :integer
    add_column :universities, :phd_books_limit, :integer
  end
end
