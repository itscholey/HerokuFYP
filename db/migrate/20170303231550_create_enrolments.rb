class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.references :user, index: { name: 'student' }, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
