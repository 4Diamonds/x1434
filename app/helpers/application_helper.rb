module ApplicationHelper
  
  def number_to_coins(coins = 0)
    pluralize(coins, 'coin', 'coins')
  end
      
end
