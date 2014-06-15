class AddGetInvolvedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :get_involved, :text
  end
end
