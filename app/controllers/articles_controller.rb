class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end
  
  private
  
  def set_article
    @item = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :body,article_images_attributes:[:id,:image])
  end

end
