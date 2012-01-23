class ListsController < ApplicationController

  before_filter :list_find, :only => [:show, :edit, :update, :destroy]
  
  def list_find
    @list = List.find(params[:id])
  end
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end
  
  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List created!"
      redirect_to lists_path
    else
      flash[:error] = "List could not be created, sorry..."
      redirect_to new_list_path
    end
  end
    
  def show
    @task = @list.tasks.new
  end
  
  def edit
  end
  
  def update
    if @list.update_attributes(params[:list])
      flash[:notice] = "List updated!"
      redirect_to lists_path
    else
      flash[:error] = "Could not update list, sorry..."
      redirect_to edit_list_path(@list)
    end
  end
  
  def destroy
    if @list.destroy
      flash[:notice] = "List deleted!"
      redirect_to lists_path
    else
      flash[:error] = "Could not delete list, sorry..."
      redirect_to lists_path
    end
  end
end
