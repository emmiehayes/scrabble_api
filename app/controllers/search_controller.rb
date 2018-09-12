class SearchController < ApplicationController
  def index 
    @presenter = SearchPresenter.new(search_params)
  end

  private 

  def search_params
    params.permit(:word)
  end
end
