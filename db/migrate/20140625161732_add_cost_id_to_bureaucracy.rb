class AddCostIdToBureaucracy < ActiveRecord::Migration
  def change
    add_column :bureaucracies, :cost_id, :integer
  end
end
