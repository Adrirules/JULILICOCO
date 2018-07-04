class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy, :home_articles]

  def search
    if params[:query].present?
      @articles = Article.search(params[:query])
    else
      @articles = Article.all
    end
  end

  def index     # GET /articles
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = most_recent
    end
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

  def home_articles
    @articles = Article.order(created_at: :desc).limit(3)

    #last_number(3)
  end

  # def autocomplete
  #   render json: Article.search(params[:search], {
  #     fields: ["title^5"],
  #     match: :word_start,
  #     limit: 10,
  #     load: false,
  #     misspellings: {below: 5}
  #   }).map(&:title)
  # end


  private

  def article_params
    params.require(:article).permit(:title, :chapo, :photo, :content, :slug, :tag_list, :skill_list , :name)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def most_recent
    Article.order(created_at: :desc)
  end

  def last_number(number)
    Article.order(created_at: :desc).limit(number)
  end
end
