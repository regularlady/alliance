class AddSalesforceContactIdClients < ActiveRecord::Migration
  def change
    add_column :clients, :contact_id, :integer
  end
end
