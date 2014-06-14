class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.string :multimedia_url
      t.references :course, index: true

      t.timestamps
    end
  end
end
