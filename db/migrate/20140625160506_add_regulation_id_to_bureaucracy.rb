class AddRegulationIdToBureaucracy < ActiveRecord::Migration
  def change
    add_column :bureaucracies, :regulation_id, :integer
  end
end
