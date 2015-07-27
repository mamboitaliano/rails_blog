class ArticlesController < ApplicationController
  def new
  end

  def create
    @article = Article.create(params[:article])

    redirect_to @article
  end
end
