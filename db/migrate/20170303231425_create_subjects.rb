class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :classGroup
      t.references :user, index: { name: 'teacher' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
