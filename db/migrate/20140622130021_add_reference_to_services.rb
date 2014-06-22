class AddReferenceToServices < ActiveRecord::Migration
  def change
    add_column :services, :reference, :text
  end
end
