class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.text :description
      t.time :time
      t.references :course, index: true
      t.references :classroom, index: true

      t.timestamps
    end
  end
end
