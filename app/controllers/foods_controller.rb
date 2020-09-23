class FoodsController < ApplicationController
  before_action :set_food, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  skip_before_action :login_required, only: :index

  def index
    @foods = Food.with_attached_image.includes(:category).page(params[:page]).recent
  end

  def show
    @food = Food.find(params[:id])
    @comment = Comment.new
    @comments = @food.comments.page(params[:page]).recent
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: '写真を投稿しました。'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @food.update(food_params)
      redirect_to @food, notice: '更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @food.destroy!
    redirect_to foods_path, notice: '投稿を削除しました'
  end

  private

  def food_params
    params.require(:food).permit(:description, :image, :category_id)
  end

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end
end
