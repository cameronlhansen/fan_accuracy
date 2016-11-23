class AddPickCountToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :picks_count, :integer
  end
end
