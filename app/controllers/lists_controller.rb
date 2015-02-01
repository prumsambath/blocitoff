class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to lists_path
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
