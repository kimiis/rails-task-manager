class TasksController < ApplicationController

  before_action :task_id, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
  def task_id
    @task = Task.find(params[:id])
  end
end
