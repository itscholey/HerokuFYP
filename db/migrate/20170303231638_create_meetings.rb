class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :subject
      t.datetime :date
      t.string :location
      t.string :agenda

      t.timestamps null: false
    end
  end
end
