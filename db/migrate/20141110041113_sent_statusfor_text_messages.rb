class SentStatusforTextMessages < ActiveRecord::Migration
  def change
    add_column :text_messages, :sentstatus, :boolean
  end
end
