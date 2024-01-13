class ArticlesController < ApplicationController
  def search
    if params[:q].present?
      @articles = Article.search(params[:q])
    else
      @articles = []
    end
  end
end
