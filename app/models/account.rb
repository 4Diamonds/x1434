class Account < ActiveRecord::Base
  belongs_to :user
  has_many :balances
  attr_accessible :cash, :coins
end