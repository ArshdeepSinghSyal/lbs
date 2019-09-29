class AddApprovedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_approved, :integer
  end
end
