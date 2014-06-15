class AddMapToStructure < ActiveRecord::Migration
  def change
    add_column :structures, :map, :string
  end
end
