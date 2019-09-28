class AddTitleToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :name, :string
    add_column :libraries, :university, :string
    add_column :libraries, :location, :string
    add_column :libraries, :max_days, :int
  end
end
