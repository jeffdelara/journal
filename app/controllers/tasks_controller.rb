class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_category, except: [:index]
  before_action :require_owner, except: [:index, :new, :create]

  # GET /tasks
  def index
    @categories = Category.includes(:tasks).where(user_id: current_user.id).reverse
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to category_task_path(@category, @task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to category_task_path(@category, @task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy

    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
    
  end


  private
  
    def require_owner 
      unless current_user.id == @task.user_id
        redirect_to tasks_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def set_category 
      @category = Category.find(params[:category_id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :due, :completed, :category_id)
    end
end
