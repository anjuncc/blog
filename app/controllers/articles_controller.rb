class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
  end
  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
