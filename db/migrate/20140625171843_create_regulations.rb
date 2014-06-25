class CreateRegulations < ActiveRecord::Migration
  def change
    create_table :regulations do |t|
      t.text :description

      t.timestamps
    end
  end
end
