class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @list.save
      respond_to do |format|
        format.html { redirect_to list }
        format.js
      end
    end
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.update(completed: true)
    @item.save
    respond_to do |format|
      format.html { redirect_to list }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
