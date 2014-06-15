class RenamePhotoToPhotos < ActiveRecord::Migration
  def change
	rename_table :photo, :photos
  end
end
