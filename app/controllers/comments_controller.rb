class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:post_id])

    if @blog.comments.create(comment_params)
      redirect_to @blog,
                  notice: 'Comment was successfully created.'
    else
      redirect_to @blog,
                  alert: 'Error creating comment.'
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end