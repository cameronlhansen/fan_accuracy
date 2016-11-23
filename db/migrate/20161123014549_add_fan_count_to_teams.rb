class AddFanCountToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :fans_count, :integer
  end
end
