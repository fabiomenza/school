class CreateAlumnis < ActiveRecord::Migration
  def change
    create_table :alumnis do |t|
      t.string :name
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
