class Admin::RewardsController < AdminController

  def index
    @rewards = Reward.all
  end

end