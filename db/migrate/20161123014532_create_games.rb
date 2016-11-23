class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :spread
      t.integer :over_under
      t.datetime :game_date_time
      t.integer :away_team_id

      t.timestamps

    end
  end
end
