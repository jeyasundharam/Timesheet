class ProjectsController < ApplicationController
  
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
  def delete
    @project=Project.find(params[:id])
    if @project.destroy
      flash[:notice]="Project Deleted"
    else
      flash[:notice]="Project Not Deleted"
    end
    redirect_to projects_show_url
  end


  def edit
   @project=Project.find(params[:id])
  end

  def create
    @project=Project.new(project_params)
    # @project=Project.create(:title=>i["title"],:description=>i[])
    if @project.save
      flash[:notice]="Project Added"
    else
      flash[:notice]="Project Not Added"
    end   
   @projects=Project.all
    render "show"
  end

  def multitasks
    @project=Project.new
  end
  def new
    end

  def update
    @tasks=params[:project][:tasks_attributes]
    @tasks.each do |i|
      j = @tasks[i]
      @task=Task.create(
        :project_id => j["project_id"],
        :title=>j["title"],
        :description=>j["description"],
        :hours=>j["hours"]
      )
      @task.save      
    end
    render "index"
  end
  def project_params
    params.require(:project).permit(:title,:description)
  end
end
