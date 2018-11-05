# frozen_string_literal: true

module AccountsHelper
  def current_page_first?
    params[:page].nil? || params[:page].to_i <= 1
  end

  def current_page_last?
    @recipes.next_page.blank?
  end

  def next_page
    (params[:page] || 1).to_i + 1
  end

  def previous_page
    return 1 if params[:page] == 1 || params[:page].nil?
    (params[:page] || 1).to_i - 1
  end
end
