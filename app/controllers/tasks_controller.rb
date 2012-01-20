class TasksController < ApplicationController
  
  def create
    @list = List.find(params[:list_id])
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
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end
  
  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end
  
  def update
    @list = List.find(params[:list_id])
    @task= @list.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task updated successfully!"
      redirect_to list_path(@list)
    else
      flash[:alert] = "Task could not be updated..."
      redirect_to list_path(@list)
    end
  end
  
  def destroy
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
      if @task.destroy
        flash[:notice] = "Task deleted!"
        redirect_to list_path(@list)
      else 
        flash[:error] = "Delete failed!"
        redirect_to list_path(@list)
      end
    end
  
  def complete
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.completed = true
    @task.save
    redirect_to list_path(@list)
  end
  
  def incomplete
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.completed = false
    @task.save
    redirect_to list_path(@list)
  end
    
end
