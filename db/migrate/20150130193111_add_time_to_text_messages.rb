class AddTimeToTextMessages < ActiveRecord::Migration
  def change
    add_column :text_messages, :scheduled_time, :time
  end
end
