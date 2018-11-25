class ItemsController < ApplicationController
  def show
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to products_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def item_params
      params.require(:item).permit(:quantity, :product_id, :cart_id, :discount )
    end
end
