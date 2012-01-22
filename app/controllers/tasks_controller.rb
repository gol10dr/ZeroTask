class TasksController < ApplicationController
  
 before_filter :list_find, :only => [:create, :new]
 before_filter :task_find, :only => [:show, :edit, :update, :destroy, :complete, :incomplete]
 
  def list_find
    @list = List.find(params[:list_id])
  end
  
  def task_find
   @list = List.find(params[:list_id]) 
   @task = @list.tasks.find(params[:id])
  end
   
  def create
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Task created!"
      redirect_to list_path(@list)
    else
      flash[:alert] = "Task could not be created..."
      redirect_to list_path(@list)
    end
  end
  
  def new
    @task = @list.tasks.new
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task updated successfully!"
      redirect_to list_path(@list)
    else
      flash[:alert] = "Task could not be updated..."
      redirect_to list_path(@list)
    end
  end
  
  def destroy
      if @task.destroy
        flash[:notice] = "Task deleted!"
        redirect_to list_path(@list)
      else 
        flash[:error] = "Delete failed!"
        redirect_to list_path(@list)
      end
    end
  
  def complete
    @task.completed = true
    @task.save
    redirect_to list_path(@list)
  end
  
  def incomplete
    @task.completed = false
    @task.save
    redirect_to list_path(@list)
  end
      
end
