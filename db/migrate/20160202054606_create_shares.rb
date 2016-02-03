class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :code
      t.string :company
      t.string :exchange

      t.timestamps null: false
    end
  end
end
