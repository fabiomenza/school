class RemoveCourseIdFromAwards < ActiveRecord::Migration
  def change
    remove_column :awards, :course_id, :integer
  end
end
