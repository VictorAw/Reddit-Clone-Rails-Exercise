class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id
    fail
    comment.save

    redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_id)
  end
end
