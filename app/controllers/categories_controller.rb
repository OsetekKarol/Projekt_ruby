class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def events  # <--- Moved OUTSIDE the private block
    @category = Category.find_by(id: params[:id]) # Use find_by to avoid exceptions
    if @category
      @events = @category.events
    else
      redirect_to categories_path, alert: "Category not found." 
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
