class Admin::WithdrawsController <AdminController

	def index
		@withdraws = Withdraw.all
	end

	def pay_withdraw
		@withdraw = Withdraw.find(params[:id])
		@withdraw.withdraw_paid!
		redirect_to [:admin, :withdraws]
  end

  def unpay_withdraw
		@withdraw = Withdraw.find(params[:id])
		@withdraw.withdraw_unpaid!
		redirect_to [:admin, :withdraws]
  end
end