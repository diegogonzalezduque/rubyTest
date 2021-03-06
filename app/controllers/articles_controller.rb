class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice:"the Article has been created" and return
    end
    render 'new'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to articles_path, notice: "#{title} has been updated" and return
    end

    render 'edit'
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, notice: "#{title} has been deleted" and return
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
