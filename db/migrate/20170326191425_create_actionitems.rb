class CreateActionitems < ActiveRecord::Migration
  def change
    create_table :actionitems do |t|
      t.string :name
      t.string :description
      t.references :actionplan, index: true, foreign_key: true
      t.datetime :target_completion_date

      t.timestamps null: false
    end
  end
end
