class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  belongs_to :category
  has_many :clicks
  has_many :comments
  has_many :followers

  attr_accessible :type, :title, :url, :value, :provider_id, :initial_likes, :published, :category, :category_id
  
  validates :title, :url, :value, presence: true
  
  scope :published, where(published: true)
    
  def to_s
    title
  end
  
  def owner
    user
  end

  def page_activate!
    self.update_attributes!(published: true)
  end
  
  def page_desactivate!
    self.update_attributes!(published: false)
  end
   
  before_create do |page|
    page.token = "#{Devise.friendly_token}!"
  end
   
end