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
    @item.update_attributes(completed: true)
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def clear_complete_items
    @list = List.find(params[:list_id])
    @list.complete_items.each do |item|
      item.destroy
    end

    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
