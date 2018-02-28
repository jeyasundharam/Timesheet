class TasksController < ApplicationController
  def index
  end

  def insert
    @projects=Project.find(params[:id])
    @project=Project.new
  end

  def show
    
  end

  def edit
  end

  def delete
    @task=Task.find(params[:id])
    if @task.delete
      flash[:notice]="Task Finished"
    else
      flash[:notice]="Task not Finished"
    end
    redirect_to projects_show_url
  end
  def create
    @task=Task.new(task_params)
    if @task.save
      flash[:notice]="Task Added"
    else
      flash[:notice]="Task not Added"
    end
    @projects=Project.find(params[:project][:id])
    @project=Project.new
    render "insert"
 end
  def update
    @project=Project.find(params[:project][:id])
    if @project.update_attributes(task_params)
      flash[:notice]="Task Upgraded"
    else
      flash[:notice]="Task Not Upgraded"
    end
    @projects=Project.find(params[:project][:id])
    @project=Project.new
    render "insert"
  end

  private
  def task_params
     params.require(:project).permit(:title,:description,tasks_attributes: [:title,:description,:hours])
  end
end
