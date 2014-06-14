class AddClassroomIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :classroom_id, :integer
  end
end
