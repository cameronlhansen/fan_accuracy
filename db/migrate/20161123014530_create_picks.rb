class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string :type
      t.integer :game_id
      t.integer :fan_id
      t.boolean :over_under_pick
      t.boolean :spread_pick

      t.timestamps

    end
  end
end
