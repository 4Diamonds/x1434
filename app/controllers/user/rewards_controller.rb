class User::RewardsController < UserController

  def index
    @rewards = current_user.rewards
  end

  def new
    @reward = current_user.rewards.build
  end

  def create
    @reward = current_user.rewards.build(params[:reward])
    if @reward.save
      redirect_to [:user, :rewards]
    else
      redirect_to :back, notice: @reward.errors.full_messages.to_sentence
    end
  end

  
end