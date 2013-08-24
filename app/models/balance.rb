class Balance < ActiveRecord::Base
  belongs_to :account
  attr_accessible :current_cash, :current_coins, :kind, :value, :title
  
  def to_s
    title
  end
end
