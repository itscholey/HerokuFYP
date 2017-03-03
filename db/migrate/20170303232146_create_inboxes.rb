class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.references :recipient, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
