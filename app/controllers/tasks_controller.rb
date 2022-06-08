class TasksController < ApplicationController

  def new
    @todolist = Todolist.find(params[:todolist_id])
  end

  def create
    @task = Task.new(task_params)
    @todolist = Todolist.find(params[:todolist_id])
    @task.todolist = @todolist
    @project = Project.find(params[:project_id])
    if @task.save

      redirect_to project_todolist_path(@project, @todolist)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @project = Project.find(params[:project_id])
    @todolist = Todolist.find(params[:todolist_id])

    @task.update(status: params[:status])
    redirect_to project_todolist_path(@project, @todolist)
  end

  private

  def task_params
    params.require(:task).permit(:description, :status)
  end

end
