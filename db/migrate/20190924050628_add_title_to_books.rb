class AddTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :string
    add_column :books, :language, :string
    add_column :books, :published, :date
    add_column :books, :edition, :float
    add_column :books, :image, :binary
    add_column :books, :subject, :string
    add_column :books, :summary, :text
    add_column :books, :is_special_collection_item, :boolean
  end
end
