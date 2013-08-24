class Admin::BalancesController < AdminController

	def index
		@balances = Balance.all
	end
end	
