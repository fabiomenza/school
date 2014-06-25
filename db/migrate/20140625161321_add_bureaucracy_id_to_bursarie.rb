class AddBureaucracyIdToBursarie < ActiveRecord::Migration
  def change
    add_column :bursaries, :bureaucracy_id, :integer
  end
end
