class AddMaxDaysToLibraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :libraries, :max_days, :int
    add_column :libraries, :max_days_undergrad, :string
    add_column :libraries, :max_days_grad, :string
    add_column :libraries, :max_days_phd, :string
  end
end
