class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.create(comment_params)
  end

  def edit

  end

  def update
    if @comment.update(update_params)
      redirect_to @comment.food, notice: 'コメントの更新が完了しました。'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(food_id: params[:food_id])
  end

  def update_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
