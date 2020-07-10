class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :winner_id
      t.string :date
      t.integer :week_id

      t.timestamps
    end
  end
end
