class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
      t.text :bio
      t.string :photo_url
      t.text :curriculum

      t.timestamps
    end
  end
end
