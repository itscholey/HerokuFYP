class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
