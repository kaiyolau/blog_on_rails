class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user!, only: [:create, :destroy]



  def create
    @comment = Comment.new(params.require(:comment).permit(:body))
    @comment.post = @post
    # @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment created!"
    else
      @comments = @post.comments.order(created_at: :desc)
      render '/posts/show', status: 303
    end
  end

  def destroy
    @comment = Comment.find params[:id]
     if can?(:crud, @comment)
      @comment.destroy
      redirect_to post_path(@post), notice: "Comment deleted"
     else
      redirect_to root_path, alert: "Not authorized"
    end
  end








  private

  def find_post
    @post = Post.find params[:post_id]
  end


  def authorize_user!
      redirect_to root_path, alert: "Not authorized!" unless can?(:crud, @product)
  end

end
