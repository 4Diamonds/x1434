class Invitation < ActiveRecord::Base
  extend FriendlyId
  friendly_id :token, use: :slugged
  
  belongs_to :user

  attr_accessible :accept, :email, :name, :user_id, :token

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  
  def to_s
    name
  end
  
  def accept!
    my_account = user.account
    coins = (my_account.coins += 10)
    my_account.update_attributes(coins: coins)
    my_account.balances.create(kind: 'Invitation', title: "You invited a friend", value: "10", current_coins: coins)
    self.update_attributes(accept: true, token: nil)
  end

  after_create do
    UserMailer.invite(self).deliver!
  end

end