# frozen_string_literal: true

module RecipesHelper
  def course_options
    [['', nil]] + Course.order(:title).map { |c| [ c.title, c.id ] }
  end
end
