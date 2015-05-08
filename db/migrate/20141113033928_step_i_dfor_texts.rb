class StepIDforTexts < ActiveRecord::Migration
  def change
    add_column :text_messages, :step_id, :integer
    add_column :text_messages, :phone, :string
  end
end
