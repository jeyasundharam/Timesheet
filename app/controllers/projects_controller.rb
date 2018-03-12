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
  def iproject
    @project = Project.new(:title=>params[:title],:description=>params[:description])
    if @project.save
      flash[:notice]="Project Added Successfully"
    else
     flash[:notice]="Project Not Added "
    end
    render "iproject"
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
      @project=Project.new
    else
 	   flash[:notice]="Project Not Added "
  	end
    render "insert" 
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

  end
  
  def updateajax
      @taskdate=params[:obj][:taskdate]
      @tasks=params[:project][:tasks_attributes]
      sum=0;
      @errors=Array.new()
      flag=false
      @tasks.each do |i|
        j = @tasks[i]    
        @task=Task.new(:project_id => j["project_id"],:taskdate=>@taskdate, :title=>j["title"],
          :description=>j["description"],:hours=>j["hours"])
        unless @task.valid?
           @task.errors.full_messages.each do |i|
                     @errors<<i
            end
           flag=true
           break
        end
        sum+=j["hours"].to_i
      end
      remaining=8-Task.where(:taskdate => @taskdate).sum(:hours)
      if sum > 8 || sum > remaining || flag
         @errors<<"Task Not Updated"
         if sum > 8
            @errors<<"Total Hours should be not exceed 8 hours."
         end 
         if sum > remaining
            if remaining > 0
                 @errors<<"Your Task date #{@taskdate} had only #{remaining} remaining hours"
            else
                  @errors<<"Your Task date #{@taskdate} had no hours"
            end
        end
        render :json => {:errors => @errors }
      else
        @task=Task.create(task_params)
        @task.save
        # @tasks.each do |i|
        #    j = @tasks[i]
        #    @task=Task.create(:project_id => j["project_id"],:taskdate=>@taskdate, :title=>j["title"],
        #   :description=>j["description"],:hours=>j["hours"])
        #    @task.save
        # end
        render :json => {:success => "Tasks Added Successfully"}
      end
  end
  def project_params
    params.require(:project).permit(:title,:description)
  end  
  def task_params
    params.require(:project).permit(tasks_attributes: [:project_id,:taskdate,:title,:description,:hours])
  end

end
