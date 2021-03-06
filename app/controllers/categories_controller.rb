class CategoriesController < ApplicationController
  before_action :set_category, only: :show
  skip_before_action :login_required

  def show
    @categories_foods = @category.foods
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
