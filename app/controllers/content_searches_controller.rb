class ContentSearchesController < ApplicationController
  def show
    @query = query
    @search = process_content_search
  end

  private

  def process_content_search
    ContentSearchProcessor.new(query)
  end

  def query
    params[:search][:query]
  end
end
