class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.text :description
      t.text :work_opportunity

      t.timestamps
    end
  end
end
