class AddCompletedToActionitem < ActiveRecord::Migration
  def up
    add_column :actionitems, :completed, :boolean, default: false
  end

  def down
    remove_column :actionitems, :completed
  end
end
