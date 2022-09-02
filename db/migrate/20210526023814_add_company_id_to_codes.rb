class AddCompanyIdToCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :codes, :company_id, :bigint
  end
end
