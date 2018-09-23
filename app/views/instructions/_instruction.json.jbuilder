# frozen_string_literal: true

json.extract! instruction, :id, :title, :instruction_group_id, :created_at, :updated_at
json.url instruction_url(instruction, format: :json)
