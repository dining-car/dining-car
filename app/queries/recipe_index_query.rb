# frozen_string_literal: true

class RecipeIndexQuery
  def initialize(relation = Recipe.all)
    @relation = relation
  end

  def query(sort_by, user, search_query, course, cuisine)
    @relation = if sort_by == "title"
      @relation.by_title
    else
      @relation.by_created_at
    end
    if user.blank?
      @relation = @relation.with_public
    else
      @relation = @relation.with_private_for_account(user.account)
    end
    @relation = @relation.search_for(search_query) if search_query
    @relation = @relation.with_course(course) if course
    @relation = @relation.with_cuisine(cuisine) if cuisine
    @relation
  end
end
