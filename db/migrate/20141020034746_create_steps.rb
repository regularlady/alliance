class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :goal

      t.text :description
      t.date :due_by
      t.boolean :complete, default: false
      
      t.timestamps
    end
    
    add_index :steps, :goal_id
  end
end
