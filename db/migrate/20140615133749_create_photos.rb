class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.references :structure, index: true

      t.timestamps
    end
  end
end
