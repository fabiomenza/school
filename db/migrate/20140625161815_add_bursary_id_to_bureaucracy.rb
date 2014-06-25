class AddBursaryIdToBureaucracy < ActiveRecord::Migration
  def change
    add_column :bureaucracies, :bursary_id, :integer
  end
end
