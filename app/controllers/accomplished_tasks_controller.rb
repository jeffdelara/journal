class AccomplishedTasksController < ApplicationController
  def update
    task_id = params[:task_id]
    task = Task.find_by(id: task_id, user_id: current_user.id)
    task.completed = params[:completed]
    if task.save 
      render json: { message: 'success', task: task }
    else 
      render json: {message: 'fail' }
    end
      
  end
end
