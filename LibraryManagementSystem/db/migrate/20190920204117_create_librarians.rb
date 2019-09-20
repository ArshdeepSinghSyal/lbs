class CreateLibrarians < ActiveRecord::Migration[5.2]
  def change
    create_table :librarians do |t|

      t.timestamps
    end
  end
end
