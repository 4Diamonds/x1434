class Reward < ActiveRecord::Base
  belongs_to :user
  attr_accessible :kind, :value
end
