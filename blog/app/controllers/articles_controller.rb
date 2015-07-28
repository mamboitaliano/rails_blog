class ArticlesController < ApplicationController
  # REMEMBER THAT PUBLIC METHODS MUST ALWAYS BE PLACED BEFORE PRIVATE METHODS

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update                           #         <------------
    @article = Article.find(params[:id])      #              |
                                              #              |
    if @article.update(article_params)        #              |
      redirect_to @article                    #              |
    else                                      #              |
      render 'edit'                           #              |
    end                                       #              |
  end                                         #              |
                                              #              |
  # The new method, update, is used when you want to update a record that already exists, and it
  # accepts a hash containing the attributes that you want to update

  # You don't need to pass all attributes to update. For example, if you'd call @article.update(title: 'A new title')
  # Rails would only update the title attribute, leaving all other attributes untouched.

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
