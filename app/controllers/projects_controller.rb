class ProjectsController < ApplicationController

  def delete
  end
  def index

  end

  def insert
   @project=Project.new
  end

  def show
    @projects=Project.all
  end

  def destroy
  end

  def edit
   @project=Project.find(params[:id])
  end

  def create
    @project=Project.new(project_params)
    if @project.save
      flash[:notice]="Project Added"
    else
      flash[:notice]="Project Not Added"
    end   
   @projects=Project.all
    render "show"
  end

  def new
    @project=Project.find(params[:id])
    if @project.destroy
      flash[:notice]="Project Deleted"
    else
      flash[:notice]="Project Not Deleted"
    end
    redirect_to project_show_url
  end

  def project_params
    params.require(:project).permit(:title,:description)
  end

end
