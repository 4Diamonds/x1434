class Withdraw < ActiveRecord::Base
  belongs_to :user
  attr_accessible :paid, :value, :gateway

  validates :value, :gateway, presence: true

  scope :paid, where(paid: true)
  
  def withdraw_paid!
  	self.update_attributes!(paid: true)
  end

  def withdraw_unpaid!
  	self.update_attributes!(paid: false)
  end	
  	
  
  after_create do |withdraw|

  	user.account.cash -= self.value
  	user.account.save!
    user.account.balances.create(kind: 'Withdraw', title: "You ordered a withdraw", value: withdraw.value, current_coins: user.account.coins, current_cash: user.account.cash)
	end
end
