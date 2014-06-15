class RenameCurriculumsCoursesToCoursesCurriculums < ActiveRecord::Migration
  def change
	rename_table :curriculums_courses, :courses_curriculums
  end
end
