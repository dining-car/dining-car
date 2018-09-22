# frozen_string_literal: true

json.extract! ingredient_group, :id, :title, :recipe, :created_at, :updated_at
json.url ingredient_group_url(ingredient_group, format: :json)
