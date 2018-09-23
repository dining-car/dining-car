# frozen_string_literal: true

json.array! @instruction_groups, partial: 'instruction_groups/instruction_group', as: :instruction_group
