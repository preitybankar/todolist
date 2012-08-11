class ListsController < ApplicationController
  
  respond_to :html, :xml, :js
  
  def index
    respond_with(@lists = List.all)
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "List Added Successfully"
      respond_with(@list, :location => list_url(@list))
    
    else
      flash[:error] = "List Could not be Created"
      redirect_to new_list_url      
    end
  end
  
  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:notice] = "List Successfully Updated"

      respond_with(@list, :location => list_url(@list))
    else
      flash[:error] = "List could not be update" 
      redirect_to edit_list_path(@list)
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      flash[:notice] = "List Deleted Successfully"
      redirect_to lists_url
    else
      flash[:error] = "could not delete List , Have u done everything?"
      redirect_to lists_url
    end
  end
  
end
