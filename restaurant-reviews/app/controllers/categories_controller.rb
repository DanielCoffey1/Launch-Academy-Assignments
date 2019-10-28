class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @restaurants = @category.restaurants
  end

  def new
    @Category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category added successfully!"
      redirect_to category_path(@category)
    else
      flash[:error] = @category.errors.full_messages.join(". \n")
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
