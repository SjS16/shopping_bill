class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
    @items = @cart.items
    @bill = @cart.open? ? Bill.new : Bill.find_by_cart_id(@cart.id)
    @coupons = Coupon.all
  end

  def create
    #set cart to open
    @cart = Cart.new(status: 0)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
end
