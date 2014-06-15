class CreateCoursesExams < ActiveRecord::Migration
  def change
    create_table :courses_exams do |t|
      t.integer :course_id
      t.integer :exam_id
    end
  end
end
