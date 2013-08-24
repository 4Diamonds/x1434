class User::OrdersController < UserController

  def index
    @orders = current_user.orders
  end

  def new
    @order = current_user.orders.build
    @packages_coins = Package.type_coins
  end

  def create
    @order = current_user.orders.build(params[:order])
    if @order.save
      redirect_to [:user, :orders]
    else
      redirect_to :back, notice: @order.errors.full_messages.to_sentence
    end
  end

  def payment
    @order = current_user.orders.find(params[:id])
  end

end