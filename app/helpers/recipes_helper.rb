# frozen_string_literal: true

module RecipesHelper
  def course_options
    [['', nil]] + Course.order(:title).map { |c| [ c.title, c.id ] }
  end
  def cuisine_options
    [['', nil]] + Cuisine.order(:title).map { |c| [ c.title, c.id ] }
  end
  def courses_menu
    safe_join(@courses.collect do |c|
      next if c.recipes_count == 0
      course_link = if @course == c
               recipes_path(@safe_params.except(:course_id))
             else
               recipes_path(@safe_params.merge(course_id: c.id))
             end
      link_class = 'is-active' if @course == c
      href = link_to(course_link, class: link_class) do
        capture do
          concat 'X ' if @course == c
          concat c.title
          concat ' '
          concat content_tag(:span, c.recipes_count, class: 'is-rounded tag is-primary')
        end
      end


      content_tag(:li, href)
    end)
  end

  def cuisines_menu
    safe_join(@cuisines.collect do |c|
      next if c.recipes_count == 0
      cuisine_link = if @cuisine == c
               recipes_path(@safe_params.except(:cuisine_id))
             else
               recipes_path(@safe_params.merge(cuisine_id: c.id))
             end
      link_class = 'is-active' if @cuisine == c
      href = link_to(cuisine_link, class: link_class) do
        capture do
          concat 'X ' if @cuisine == c
          concat c.title
          concat ' '
          concat content_tag(:span, c.recipes_count, class: 'is-rounded tag is-primary')
        end
      end


      content_tag(:li, href)
    end)
  end

  def order_by_title_li
    link_class = 'is-active' if params[:sort_by] == 'title'
    content_tag(:li, link_to(Recipe.human_attribute_name(:title), recipes_path(@safe_params.merge({sort_by: 'title'})), class: link_class))
  end

  def order_by_created_at_li
    link_class = 'is-active' if params[:sort_by] != 'title'
    content_tag(:li, link_to(Recipe.human_attribute_name(:created_at), recipes_path(@safe_params.except(:sort_by)), class: link_class))
  end

  def ordering_menu
    safe_join [order_by_title_li, order_by_created_at_li]
  end
end
