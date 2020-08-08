class SearchesController < ApplicationController
  def show
    @search = Search.new(term: params.dig(:search, :term))
  end
end