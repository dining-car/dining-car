# frozen_string_literal: true

json.extract! ingredient, :id, :title, :ingredient_group_id, :quantity, :unit_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
