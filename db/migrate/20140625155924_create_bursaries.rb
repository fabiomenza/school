class CreateBursaries < ActiveRecord::Migration
  def change
    create_table :bursaries do |t|
      t.text :description

      t.timestamps
    end
  end
end
