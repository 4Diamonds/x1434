class Admin::OrdersController < AdminController
	def index
		@orders = Order.all
	end

	def pay_order
		@order = Order.find(params[:id])
		@order.order_paid!
		redirect_to [:admin, :orders]
  end

  def unpay_order
		@order = Order.find(params[:id])
		@order.order_unpaid!
		redirect_to [:admin, :orders]
  end

end	
