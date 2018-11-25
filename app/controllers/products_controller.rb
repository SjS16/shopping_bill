class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @item = Item.new
    Cart.create!(status: 0) unless !Cart.where(status: 0).blank?
    @carts = Cart.where(status: 0)
  end

  private
      # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit()
    end
end
