class AddClassroomIdToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :classroom_id, :integer
  end
end
