# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts/1
  def show
    @recipes = @account.recipes
    @recipes = @recipes.by_created_at
    @recipes = @recipes.with_public if current_account != @account
    @recipes = @recipes.page params[:page]
  end

  private
    def set_account
      @account = Account.find_local!(params[:username])
    end
end
