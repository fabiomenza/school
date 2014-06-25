class AddBureaucracyIdToRegulation < ActiveRecord::Migration
  def change
    add_column :regulations, :bureaucracy_id, :integer
  end
end
