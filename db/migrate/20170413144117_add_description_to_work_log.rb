class AddDescriptionToWorkLog < ActiveRecord::Migration
  def change
    add_column :work_logs, :description, :string
  end
end
