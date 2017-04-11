class AddLessonWorkToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_work, :string
  end
end
