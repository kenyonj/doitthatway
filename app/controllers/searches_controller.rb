class SearchesController < ApplicationController
  def show
    @query = query_params
    @search = process_search(@query)
  end

  private

  def query_params
    params[:search][:query]
  end
end
