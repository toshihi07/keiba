class PostsController < ApplicationController
before_action :set_group

  def new
    @post = Post.new
    @posts = Post.all.limit(10).order("created_at DESC")
    @posts_length = Post.all
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    if  @post.save
    redirect_to top_index_path
    else
      render :new
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
