class PostsController < ApplicationController
  # =============CALLBACKS=====================
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action :authorize_user!, only:[:edit, :update, :destroy]







    # =============CREATE========================
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]= "Question created successfully!"
      redirect_to post_path(@post)
    else
      render :new
    end
  end


  # ================READ========================

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end


 # ===============UPDATE==========================
  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end


  # ================DELETE=========================

  def destroy
    @post.destroy
    redirect_to posts_path
  end





  private

  def authorize_user!
    redirect_to root_path, alert: "Not authorized" unless can?(:crud, @post)
  end

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
