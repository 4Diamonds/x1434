class Admin::CategoriesController < AdminController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category was successfully created.'
    else
      render action: :new
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to [:admin, :categories], notice: 'Category was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to [:admin, :categories], notice: "Deleted!"
  end

  def category_desactivate
    @category = Category.find(params[:id])
    @category.category_desactivate!
    redirect_to [:admin, :categories]
  end
  
  def category_activate
    @category = Category.find(params[:id])
    @category.category_activate!
    redirect_to [:admin, :categories]
  end  
end