class AddClassroomIdToService < ActiveRecord::Migration
  def change
    add_column :services, :classroom_id, :integer
  end
end
