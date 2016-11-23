class AddPickCountToFans < ActiveRecord::Migration[5.0]
  def change
    add_column :fans, :picks_count, :integer
  end
end
