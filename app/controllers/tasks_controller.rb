class TasksController < ApplicationController
  def index
    read
  end

  def show
    find
  end

  def new
    @task = Task.new
  end

  def edit
    find
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def read
    @tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end

  def update
    find
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def delete
    find
    @task.destroy
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
