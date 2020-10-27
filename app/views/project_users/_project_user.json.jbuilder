json.extract! project_user, :user_id, :project_id, :firstname, :lastname, :email
json.url project_user_url(project_user, format: :json)
