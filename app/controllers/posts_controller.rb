class PostsController < ApplicationController
before_action :set_group

  def new
    @post = Post.new
    @posts = Post.where(race_group_id:@race_group.id).limit(10).order("created_at ASC").page(params[:page]).per(100)
    @posts_length = @race_group.posts
  end

  def create
    @post = Post.new(post_params)
    @posts_length = @race_group.posts
    respond_to do |format|
      if @post.save
      format.json 
        end
      else
      flash.now[:alert] = 'メッセージを入力してください。'
    end
  end

  private

  def set_group
    @race_group = RaceGroup.find(params[:race_group_id])
  end

  def post_params
    params.require(:post).permit(:prediction, :body).merge(user_id: current_user.id,race_group_id: params[:race_group_id])
  end

end
