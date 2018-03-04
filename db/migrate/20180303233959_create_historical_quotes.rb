class CreateHistoricalQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :historical_quotes do |t|
      t.string :date
      t.string :open
      t.string :high
      t.string :low
      t.string :close
      t.string :volume
      t.references :stock

      t.timestamps
    end
  end
end
