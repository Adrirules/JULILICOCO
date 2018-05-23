class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def search
    if params[:query].present?
      @articles = Article.search(params[:query])
    else
      @articles = Article.all
    end
  end

  def index     # GET /articles
    # search = params[:term].present? ? params[:term] : nil
    # @articles = if search
    #   Article.search(search)
    # else

    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
    # end
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
    params.require(:article).permit(:title, :chapo, :photo, :content, :slug, :tag_list)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
