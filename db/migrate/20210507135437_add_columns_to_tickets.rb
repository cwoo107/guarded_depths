class AddColumnsToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :webhook_sent, :boolean
    add_column :tickets, :email_sent, :boolean
  end
end
