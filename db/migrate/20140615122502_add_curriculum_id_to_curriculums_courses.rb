class AddCurriculumIdToCurriculumsCourses < ActiveRecord::Migration
  def change
    add_column :curriculums_courses, :curriculum_id, :integer
  end
end
