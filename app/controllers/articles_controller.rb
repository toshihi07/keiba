class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @articles = Article.all.includes(:article_images).limit(10).order("created_at DESC")
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    3.times { @article.article_images.build }
    if @article.save
      redirect_to root_path
    else
      redirect_to '/articles/new'
  end
end
  
  private
  
  def set_article
    @item = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :body,article_images_attributes:[:id,:image]).merge(user_id: current_user.id)
  end

end
