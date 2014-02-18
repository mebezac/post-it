class CategoriesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:new, :create]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "You saved a new category"
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end