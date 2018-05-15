class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index         # GET /articles
    @articles = Article.all
  end

  def show          # GET /articles/:id
  end

  def new           # GET /articles/new
    @article = Article.new
  end

  def create        # POST /articles
    @article = Article.new(params[:article])
    @article.save
  end

  def edit          # GET /articles/:id/edit
  end

  def update        # PATCH /articles/:id
    @article.update(params[:article])
  end

  def destroy       # DELETE /articles/:id
    @article.destroy
  end


  private

  def article_params
    params.require(:article).permit(:title, :chapo, :photo, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
