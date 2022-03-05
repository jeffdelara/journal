class TodayTasksController < ApplicationController
  
  def index
    @tasks = 
      Task.includes(:category).
        where(due: Date.today.beginning_of_day..Date.today.end_of_day, user_id: current_user.id)
  end

end
