class CreateHowToGetTheres < ActiveRecord::Migration
  def change
    create_table :how_to_get_theres do |t|
      t.text :description

      t.timestamps
    end
  end
end
