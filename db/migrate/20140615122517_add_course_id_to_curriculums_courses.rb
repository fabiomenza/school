class AddCourseIdToCurriculumsCourses < ActiveRecord::Migration
  def change
    add_column :curriculums_courses, :course_id, :integer
  end
end
