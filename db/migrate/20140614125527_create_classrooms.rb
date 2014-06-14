class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.text :description
      t.text :how_to_get_there

      t.timestamps
    end
  end
end
