class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :w_day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
