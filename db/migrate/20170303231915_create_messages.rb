class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true, foreign_key: true
      t.string :body
      t.references :recipient, index: { name: 'sender' }, foreign_key: true

      t.timestamps null: false
    end
  end
end
