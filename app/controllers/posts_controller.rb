class PostsController < ApplicationController
before_action :set_group

  def new
    @post = Post.new
    @posts = Post.all.limit(10).order("created_at DESC")
    @posts_length = @race_group.posts
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
      # format.html { redirect_to "/race_groups/#{@race_group.id}/posts/new"}
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
