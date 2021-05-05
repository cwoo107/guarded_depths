class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :code, null: false, foreign_key: true
      t.json :ticket

      t.timestamps
    end
  end
end
