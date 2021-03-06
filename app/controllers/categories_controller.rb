class CategoriesController < ApplicationController

  before_action :set_category, :only => [:show, :edit, :update, :destroy]
  before_action :require_owner, :except => [:index, :new, :create]



  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = current_user.categories.build
  end

  def edit; end

  def create
    @category = current_user.categories.build category_params

    if @category.save
      redirect_to tasks_path, :notice => 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to tasks_path, :notice => 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to tasks_path, :notice => 'Category was successfully destroyed.'
  end



  private

  def require_owner 
    redirect_to tasks_path unless current_user.id == @category.user_id 
  end

  def set_category
    @category = current_user.categories.find params[:id]
  end

  def category_params
    params.require(:category).permit :name
  end

end
