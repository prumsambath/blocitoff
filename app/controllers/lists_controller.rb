class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      respond_to do |format|
        format.html do
          flash[:notice] = 'A new list has been successfully added.'
          redirect_to lists_path
        end
        format.js
      end
    else
      flash[:error] = 'Error while adding a new list.'
      render :index
    end
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
