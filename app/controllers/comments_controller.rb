class CommentsController < ApplicationController
before_action :authenticate_user!
  

  def create
    # binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "コメントできません"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(article_id:params[:article_id], user_id: current_user.id)
  end

end
