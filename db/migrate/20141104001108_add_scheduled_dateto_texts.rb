class AddScheduledDatetoTexts < ActiveRecord::Migration
  def change
    add_column :text_messages, :scheduled_date, :date
  end
end
