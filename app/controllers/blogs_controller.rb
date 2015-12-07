class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Post.new(post_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog,
                      notice: 'Post was successfully created.' }
        format.json { render action: 'show',
                      status: :created, location: @blog }

      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog,
                      notice: 'Post was successfully updated.' }
        format.json { render action: 'show',
                      status: :ok, location: @blog }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors,
                      status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end