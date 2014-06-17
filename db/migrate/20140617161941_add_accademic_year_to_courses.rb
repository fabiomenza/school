class AddAccademicYearToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :accademic_year, :date
  end
end
