json.extract! code, :id, :code, :user_id, :webhook, :forward_address, :created_at, :updated_at
json.url code_url(code, format: :json)
