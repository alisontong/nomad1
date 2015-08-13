class CommentsController < ApplicationController

  # Method to create a new post
  def create
    if current_user
      comment = Comment.create(comment_params)
      comment.user_id = current_user.id
      comment.post_id = params[:post_id]
      post = Post.find(params[:post_id])
      if comment.save 
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
    @comment = Comment.new
    render :new
  end

  def destroy
    comment = Comment.find(params[:id])
    if post.comments.include? comment
      comment.destroy
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  

  private
    def comment_params
      params.require(:comment).permit(:description, :post_id, :user_id)
    end
end
