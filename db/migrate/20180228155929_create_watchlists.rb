class CreateWatchlists < ActiveRecord::Migration[5.1]
  def change
    create_table :watchlists do |t|
      t.references :user
      t.references :stock

      t.timestamps
    end
  end
end
