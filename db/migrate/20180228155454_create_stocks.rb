class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :last
      t.string :open
      t.string :close
      t.string :high
      t.string :low
      t.string :volume

      t.timestamps
    end
  end
end
