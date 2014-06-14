class AddStrucutreIdToService < ActiveRecord::Migration
  def change
    add_column :services, :structure_id, :integer
  end
end
