class Package < ActiveRecord::Base

  has_many :orders
  attr_accessible :coins, :title, :value, :cash, :cat, :active

  scope :active, where(active: true)
  scope :type_coins, active.where(cat: 'coins')
    
  def to_s
    title
  end

  def package_activate!
  	self.update_attributes!(active: true)
  end
  
  def package_desactivate!
  	self.update_attributes!(active: false)
  end
end
