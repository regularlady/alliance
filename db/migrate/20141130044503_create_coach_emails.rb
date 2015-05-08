class CreateCoachEmails < ActiveRecord::Migration
  def change
    create_table :coach_emails do |t|
      t.belongs_to :user

      t.string :email, null: false
      t.string :coach_firstname 
      t.string :client_lastname
      t.string :client_firstname
      t.text :content, null: false
      t.boolean :sentstatus

      t.timestamps
    end

    add_index :coach_emails, :user_id
  end
end

