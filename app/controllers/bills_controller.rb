class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # POST /bills
  # POST /bills.json
  def create
    @cart = Cart.find(bill_params[:cart_id])

    if bill_params[:coupon_id].nil?
      @total = @cart.calc_total
      @bill = Bill.new(total: @total, cart_id: @cart.id)
    else
      @total = @cart.calc_total - Coupon.find(bill_params[:coupon_id]).discount
      @bill = Bill.new(total: @total, cart_id: @cart.id, coupon_id: bill_params[:coupon_id])
    end

    respond_to do |format|
      if @bill.save
        @cart.update(status: 1)
        format.html { redirect_to @cart, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:cart_id, :coupon_id)
    end
end
