class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  attr_accessible :active, :name
  
  has_many :pages
  
  validates :name, presence: true
  scope :active, where(active: true)
  
  def to_s
    name
  end
  
  def category_activate!
  	self.update_attributes!(active: true)
  end
  
  def category_desactivate!
  	self.update_attributes!(active: false)
  end	
end
