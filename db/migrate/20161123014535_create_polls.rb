class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :game_id
      t.integer :fan_id
      t.text :question

      t.timestamps

    end
  end
end
