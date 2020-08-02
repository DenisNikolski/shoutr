class HashtagsController < ApplicationController
  def show
    @search = Search.new(term: params[:id])
  end
end
