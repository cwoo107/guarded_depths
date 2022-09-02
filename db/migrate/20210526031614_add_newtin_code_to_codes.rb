class AddNewtinCodeToCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :codes, :newtin_code, :string
  end
end
