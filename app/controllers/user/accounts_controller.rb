class User::AccountsController < UserController
  
  def index
    @account = current_user.account
    @balance = @account.balances
  end
  
end