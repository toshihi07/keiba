class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @articles = Article.all.includes(:article_images).order("created_at DESC").page(params[:page]).per(8)
    @comments = Comment.all.order("created_at DESC").last(5)
  end

  def show
    @comments = Comment.all.order("created_at DESC").last(5)
    @article_comments = @article.comments.includes(:user).order("created_at DESC")
    @comment = Comment.new
    # @comment.user_id = current_user.id
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

  def archives
# 条件を年と月に設定してグループ化し、記事数をカウント
    archives = Post.count(:all,:group => "strftime('%Y-%m', posts.created_at)")
# ソートする
    archives.sort! {|a, b| a[0] <=> b[0]}
# 年と月を分離する
    @archives = Post.find(:all,:select => "DISTINCT strftime('%Y-%m', posts.published_at) AS published_at")  
  end
  
  private
  
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :body,article_images_attributes:[:id,:image]).merge(user_id: current_user.id)
  end

end
