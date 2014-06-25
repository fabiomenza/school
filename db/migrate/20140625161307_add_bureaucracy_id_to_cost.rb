class AddBureaucracyIdToCost < ActiveRecord::Migration
  def change
    add_column :costs, :bureaucracy_id, :integer
  end
end
