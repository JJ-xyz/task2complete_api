class TasksController < ApplicationController

  #GET /api/allTasks
  def index
    allTasks = Task.all
    render json: allTasks
  end

  #GET /api/someTask assigned to...
  def indexTo
    oneUser = User.find(params[:id])
    render json: oneUser.obligations
  end

  #GET /api/someTask assigned by...
  def indexBy
    oneUser = User.find(params[:id])
    render json: oneUser.delegations
  end

  #GET /api/oneTask
  def show
  oneTask = Task.find(params[:id])
  render json: oneTask
  end

  #POST /api/create oneTask
  def create
    oneTask = Task.new(task_params)
    puts(task_params)

    if oneTask.save
      render json: oneTask, status: :created, task: oneTask
    else
      render json: oneTask.errors, status: :unprocessable_entity
    end
  end

  #PATCH/PUT /api/update oneTask
  def update
    oneTask = Task.find(params[:id])

    if oneTask.update(task_params)
      render json: oneTask
    else
      render json: oneTask.errors, status: :unprocessable_entity
    end
  end

  #DELETE /api/delete oneTask
  def destroy
    oneTask = Task.find(params[:id])
    oneTask.destroy

    if oneTask.destroy
      render json: {status: 204}
    else
      render json: oneTask.errors, status: :unprocessable_entity
    end
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
