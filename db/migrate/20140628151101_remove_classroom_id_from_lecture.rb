class RemoveClassroomIdFromLecture < ActiveRecord::Migration
  def change
  	remove_column :lectures, :classroom_id
  end
end
