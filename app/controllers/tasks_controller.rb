class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @found = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    new_task = params.require(:task).permit(:title, :details)
    Task.create(new_task)
    redirect_to tasks_path
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    new_task = params.require(:task).permit(:title, :details)
    @tasks.update(new_task)
    redirect_to task_path(@tasks)
  end


end
