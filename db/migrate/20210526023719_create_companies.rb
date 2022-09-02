class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :billing_code
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
