json.extract! recipe, :id, :title, :info, :public, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
