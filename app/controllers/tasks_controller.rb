class TasksController < ApplicationController

  #GET /allTasks
  def index
    allTasks = Task.all
    render json: allTasks
  end

  #GET /someTask assigned by
  def indexBy
    u = User.find(params[:id])
    render json: u.delegations
  end

  #GET /someTask assigned to
  def indexTo
    u = User.find(params[:id])
    render json: u.obligations
  end



  private
    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(
        :name,
        :description,
        :date_assigned,
        :date_due,
        :date_completed,
        :assigned_to,
        :assigned_by
        )
    end






end
