class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @subs = Sub.all
  end

  def create
    post = Post.new(post_params)
    post.sub_id = params[:sub_id]
    post.author_id = current_user.id

    if post.save
      redirect_to post_url(post)
    else
      redirect_to new_sub_post_url
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    if @post.author_id == current_user.id
      render :edit
    else
      redirect_to post_url(@post)
    end
  end

  def update
    post = Post.find(params[:id])

    if post.author_id == current_user.id
      if post.update(post_params)
        redirect_to post_url(post)
      else
        redirect_to new_sub_post_url
      end
    else
      redirect_to post_url(post)
    end
  end

  def destroy
    post = Post.find(params[:id])

    if post.author_id == current_user.id
      post.destroy
    end

    redirect_to sub_posts_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :post_id, :author_id, sub_ids: [])
  end
end
