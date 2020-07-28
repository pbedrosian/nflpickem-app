class AddStatusAndBroadcastersToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :status, :string
    add_column :games, :network, :string
  end
end
