class TasksController < ApplicationController
  
  before_action :set_category, :except => [:index]
  before_action :set_task, :only => [:show, :edit, :update, :destroy]
  before_action :require_owner, :except => [:index, :new, :create]


  
  def index
    @categories = 
      Category.includes(:tasks).
      where(user_id: current_user.id).
      reverse
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  # POST /tasks
  def create
    @task = current_user.tasks.build task_params

    if @task.save
      redirect_to category_task_path(@category, @task), :notice => 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to category_task_path(@category, @task), :notice => 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, :notice => 'Task was successfully destroyed.'
  end



  private
  
  def require_owner 
    redirect_to tasks_path unless current_user.id == @task.user_id
  end

  def set_task
    @task = @category.tasks.find params[:id]
  end

  def set_category 
    @category = current_user.categories.find params[:category_id]
  end

  def task_params
    params.require(:task).permit :title, :description, :due, :completed, :category_id
  end

end
