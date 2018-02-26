class TasksController < ApplicationController
  def index
  end

  def insert
    @thisproject=Project.find(params[:id])
    @project=Project.new
  
  end

  def show
  end

  def edit
  end

  def delete
  end
end
