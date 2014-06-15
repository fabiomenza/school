class RenamePhotosToPhoto < ActiveRecord::Migration
  def change
	rename_table :photos, :photo
  end
end
