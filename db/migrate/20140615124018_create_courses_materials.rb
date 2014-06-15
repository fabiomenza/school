class CreateCoursesMaterials < ActiveRecord::Migration
  def change
    create_table :courses_materials do |t|
      t.integer :course_id
      t.integer :material_id
    end
  end
end
