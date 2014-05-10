class UserSearchesController < ApplicationController
  def show
    @search = process_user_search
  end

  private

  def process_user_search
    UserSearcher.new(query)
  end

  def query
    params[:search][:query]
  end
end
