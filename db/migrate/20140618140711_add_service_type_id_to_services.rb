class AddServiceTypeIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :service_type_id, :integer
  end
end
