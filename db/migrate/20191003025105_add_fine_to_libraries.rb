class AddFineToLibraries < ActiveRecord::Migration[5.2]
  def change
    add_column :libraries, :fine, :integer
  end
end
