json.extract! company, :id, :company_name, :billing_code, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)
