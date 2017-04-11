class SearchesController < ApplicationController
  
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.save
  end
  
  private
  def search_params
    params.require(:search).permit(:keywords, :search_result)
  end
end
