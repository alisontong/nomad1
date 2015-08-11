class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  # Method to create a new post
  def create
    if current_user
      post = current_user.posts.create(post_params)
      if post.save 
        # if the post saves redirect to the post path with the new post
        redirect_to post_path(post)
      else 
        flash[:error] = "Something went wrong, please try again"
      end
    else
      redirect_to login_path
      flash[:error] = "Please log in to post"
    end
  end

  def new
    @post = Post.new
    render :new
  end

  def show
    id = params[:id]
    post = Post.find(id)
    render :show
  end

  def delete
    id = params[:id]
    post = User.post.find(id)
    post.destroy
    redirect_to user_path(current_user)
  end 

  def edit
    id = params[:id]
    post = User.post.find(id)
    render :edit
  end

  def update
    id = params[:id]
    post = User.post.find(id)
    post.update_attributes(post_params)
    redirect_to user_post_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :city_id)
    end

end
