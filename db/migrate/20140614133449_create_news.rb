class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :name
      t.text :description
      t.time :time
      t.references :course, index: true

      t.timestamps
    end
  end
end
