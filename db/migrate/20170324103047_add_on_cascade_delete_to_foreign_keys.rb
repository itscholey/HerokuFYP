class AddOnCascadeDeleteToForeignKeys < ActiveRecord::Migration
  def change
    # assignments
    remove_foreign_key :assignments, :users
    remove_foreign_key :assignments, :roles
    add_foreign_key :assignments, :users, on_delete: :cascade
    add_foreign_key :assignments, :roles, on_delete: :cascade

    # lessons
    remove_foreign_key :lessons, :subjects
    add_foreign_key :lessons, :subjects, on_delete: :cascade

    # enrolments
    remove_foreign_key :enrolments, :users
    remove_foreign_key :enrolments, :subjects
    add_foreign_key :enrolments, :subjects, on_delete: :cascade
    add_foreign_key :enrolments, :users, on_delete: :cascade

    # attendees
    remove_foreign_key :attendees, :users
    remove_foreign_key :attendees, :meetings
    add_foreign_key :attendees, :users, on_delete: :cascade
    add_foreign_key :attendees, :meetings, on_delete: :cascade

    # recipients
    remove_foreign_key :recipients, :users
    remove_foreign_key :recipients, :conversations
    add_foreign_key :recipients, :users, on_delete: :cascade
    add_foreign_key :recipients, :conversations, on_delete: :cascade

    # messages
    remove_foreign_key :messages, :recipients
    remove_foreign_key :messages, :conversations
    add_foreign_key :messages, :recipients, on_delete: :cascade
    add_foreign_key :messages, :conversations, on_delete: :cascade

    # inboxes
    remove_foreign_key :inboxes, :recipients
    remove_foreign_key :inboxes, :messages
    add_foreign_key :inboxes, :recipients, on_delete: :cascade
    add_foreign_key :inboxes, :messages, on_delete: :cascade
  end
end
