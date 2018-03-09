class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :user
      t.string :user_selections
      t.string :admin_selections
      t.string :outcome
      t.boolean :is_over

      t.timestamps
    end
  end
end
