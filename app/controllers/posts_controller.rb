class PostsController < ApplicationController
  
  @tags = Post.tag_counts_on(:tags)

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
        redirect_to profile_path(current_user)
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
    @post = Post.find(params[:id])
    @comment = Comment.new
   
    render :show

  end 


  def edit
    
    @post = Post.find(params[:id])
    if current_user.posts.include? @post
      render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    post = Post.find(params[:id])
    if current_user.posts.include? post
      post.update_attributes(post_params)
      redirect_to post_path(post)
    else
      redirect_to post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.posts.include? post
      post.destroy


      redirect_to profile_path(current_user)
    else
      redirect_to profile_path(current_user)
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :city_id, :tag_list)
  end

end
