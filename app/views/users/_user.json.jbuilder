json.extract! user, :id, :email, :invitation_code, :user_id, :phone, :name, :created_at, :updated_at
json.url user_url(user, format: :json)
