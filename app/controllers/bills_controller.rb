class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # POST /bills
  # POST /bills.json
  def create
    @cart = Cart.find(bill_params[:cart_id])

    if bill_params[:coupon_code] == ""
      @total = @cart.calc_total
      @bill = Bill.new(total: @total, cart_id: @cart.id)
      respond
    else
      if valid_coupon?
        @total = @cart.calc_total - Coupon.find(@coupon_id).discount
        @bill = Bill.new(total: @total, cart_id: @cart.id, coupon_code: bill_params[:coupon_code])
        respond
      else
        redirect_to @cart, notice: 'Invalid coupon'
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
      params.require(:bill).permit(:cart_id, :coupon_code)
    end

    def valid_coupon?
      @cart = Cart.find(bill_params[:cart_id])
      #check coupon exists
      if Coupon.where(code: params[:bill][:coupon_code]).exists?
        @c = Coupon.find_by_code(params[:bill][:coupon_code])
        #check coupon amount isn't more than bill total
        if @c.discount < @cart.calc_total
          @coupon_id = c[1]
        else
          return false
        end
      else
        return false
      end
    end

    def respond
      respond_to do |format|
        if @bill.save
          #set cart to closed so no more can be added
          @cart.update(status: 1)
          format.html { redirect_to @cart, notice: 'Bill was successfully created.' }
          format.json { render :show, status: :created, location: @bill }
        else
          format.html { redirect_to @cart, notice: 'Must have at lesst one product.' }
        end
      end
    end

end
