class ProjectsController < ApplicationController
  
  before_action :authenticate_user!
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
    @project = Project.new(project_params)
    if @project.save
      flash[:notice]="Project Added Successfully"
 	   redirect_to projects_insert_url
 	  else
 	   flash[:notice]="Project Not Added "
           render "insert" 
  	end
  end

  def multitasks
    @project=Project.new
  end

  def showtasks
    @projects=Project.all
  end
  
  def new
  end

  def updateproject
    @project=Project.find(params[:project][:id])
    if @project.update_attributes(project_params)
      flash[:notice]="Project Updated"
    else
      flash[:notice]="Project Not updated"
    end
    redirect_to projects_show_url
  end
  
  def update
    
    @taskdate=params[:obj][:taskdate]
    @tasks=params[:project][:tasks_attributes]
    @errors=Array.new()
    sum=0;
    k=0;
    @tasks.each do |i|
      j = @tasks[i]     
      sum+=j["hours"].to_i
       k+=1
    end
    remaining=8-Task.where(:taskdate => @taskdate).sum(:hours)
    if sum > 8 || sum > remaining
       @errors<<"Task Not Updated"
       if sum > 8
        @errors<<"Total Hours should be not exceed 8 hours "
      end 
      if sum > remaining
        if remaining > 0
          @errors<<"Your Task date #{@taskdate} had only #{remaining} remaining hours"
        else
          @errors<<"Your Task date #{@taskdate} had no hours"
        end
      end
     @project=Project.new()
        k.times{@project.tasks.build}
        k=0
        @tasks.each do |i|
          j = @tasks[i]   
          @project.tasks[k].project_id=j["project_id"]
          @project.tasks[k].title=j["title"]
          @project.tasks[k].description=j["description"]
          @project.tasks[k].hours=j["hours"]
          k+=1
        end
      render "multitasks"
    else
      @tasks.each do |i|
        j = @tasks[i]
        @task=Task.create(
          :project_id => j["project_id"],
          :taskdate=>@taskdate,
          :title=>j["title"],
          :description=>j["description"],
          :hours=>j["hours"]
        )
         @task.save
      end  
      redirect_to projects_showtasks_url
    end
  end
  
  def project_params
    params.require(:project).permit(:title,:description)
  end
end
