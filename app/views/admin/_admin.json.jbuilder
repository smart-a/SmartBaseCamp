# json.extract! admin, :id, :created_at, :updated_at
# json.url admin_url(admin, format: :json)

json.extract! user, :id, :firstname, :lastname, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
