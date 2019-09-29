class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :lib_book, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status
      t.datetime :checkoutstamp
      t.datetime :returnstamp
      t.datetime :requeststamp

      t.timestamps
    end
  end
end
