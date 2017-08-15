class TasksController < ApplicationController

def index
  @tasks = Task.all
end

def show
@task = Task.find(params[:id])
end

def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def update
     @task = Task.find(params[:id])
    @task.update(update_task_params)
    redirect_to tasks_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :status)
  end

def update_task_params
    params.require(:task).permit(:status)
  end
end
