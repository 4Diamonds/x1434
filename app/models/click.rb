# encoding: utf-8
class Click < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  attr_accessible :value, :page_id, :user_id, :kind

  def to_s
    page.title
  end
     
  after_create :process_click

  private

  def process_click
    owner_account = page.owner.account
    owner_coins   = owner_account.coins
    owner_cash    = owner_account.cash * 1000
    my_account    = user.account
    my_coins      = my_account.coins
    my_cash       = my_account.cash * 1000
    diff          = owner_coins - page.value
  
    if diff >= 0
      owner_coins = diff
      my_coins = (my_account.coins += (page.value - 1))
    else
      owner_cash += diff
      my_coins    = my_coins + owner_coins
      my_cash     = my_cash  - (diff + 1)
      owner_coins = 0
    end
    
    owner_cash = (owner_cash / 1000)
    my_cash    = (my_cash / 1000)

    owner_account.update_attributes(coins: owner_coins, cash: owner_cash)
    my_account.update_attributes(coins: my_coins, cash: my_cash)
    
    self.value = (page.value - 1)
    self.save
    user.account.balances.create(kind: 'click', title: "You made a click", value: self.value, current_coins: my_coins, current_cash: my_cash)
  end
  
end