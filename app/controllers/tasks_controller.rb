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
    @projects=Project.find(params[:project][:id])
    @project=Project.find(params[:project][:id])
    if @project.update_attributes(task_params)
      flash[:notice]="Task Upgraded"
      @project=Project.new    
    else
      flash[:notice]="Task Not Upgraded"
      @errors=@project.errors
    end
    render "insert"
  end
  def update
  end

  private
  def task_params
     params.require(:project).permit(tasks_attributes: [:taskdate,:title,:description,:hours])
  end
end
