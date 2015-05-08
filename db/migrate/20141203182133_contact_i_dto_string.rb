class ContactIDtoString < ActiveRecord::Migration
  def change
    change_column :clients, :contact_id, :text
  end
end
