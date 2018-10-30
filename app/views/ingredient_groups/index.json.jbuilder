# frozen_string_literal: true

json.array! @ingredient_groups, partial: "ingredient_groups/ingredient_group", as: :ingredient_group
