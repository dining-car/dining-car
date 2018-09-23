# frozen_string_literal: true

json.extract! instruction_group, :id, :title, :recipe_id, :created_at, :updated_at
json.url instruction_group_url(instruction_group, format: :json)
