class CreateBureaucracies < ActiveRecord::Migration
  def change
    create_table :bureaucracies do |t|
      t.text :description

      t.timestamps
    end
  end
end
