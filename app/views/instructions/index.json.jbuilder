# frozen_string_literal: true

json.array! @instructions, partial: 'instructions/instruction', as: :instruction
