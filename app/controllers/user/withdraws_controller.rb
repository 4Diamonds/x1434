class User::WithdrawsController < UserController

  def index
    @withdraws = current_user.withdraws 
  end

  def new
    @withdraw = current_user.withdraws.build
  end

  def create
    @withdraw = current_user.withdraws.build(params[:withdraw])
    if @withdraw.save
      redirect_to [:user, :accounts]
    else
      redirect_to :back, notice: @withdraw.errors.full_messages.to_sentence
    end
  end

  
end