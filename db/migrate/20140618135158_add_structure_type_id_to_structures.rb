class AddStructureTypeIdToStructures < ActiveRecord::Migration
  def change
    add_column :structures, :structure_type_id, :integer
  end
end
