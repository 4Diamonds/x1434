class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :paypal_email, :pagseguro_email, :active

  validates :name, :email, presence: true

  has_many :pages
  has_many :clicks
  has_many :invitations
  has_many :orders
  has_many :withdraws
  has_many :rewards
  has_one  :account
  
  has_many :facebook_likes
  has_many :facebook_shares
  has_many :facebook_followers
  has_many :facebook_comments
  has_many :instagram_followers
  has_many :instagram_likes

  scope :active, where(active: true)
  
  def to_s
    name
  end

  def member?
    !account.plan.value.zero?
  end

  def likes_page(page)
    likes.build(page_id: page.id, value: page.value).save
  end

  def comments_page(page)
    comments.build(page_id: page.id, value: page.value).save
  end

  def followers_page(page)
    followers.build(page_id: page.id, value: page.value).save
  end

  def coins
    account.coins
  end
  
  def cash
    account.cash
  end

  def has_cash
    account.cash > 0
  end

  def has_page
    pages.any?
  end

  def pagseguro?
    pagseguro_email.blank?
  end

  def paypal?
    paypal_email.blank?
  end

  def can_withdraw?
    account.cash >= 50
  end

  def daily_bonus
    clicks.count >= 15
  end

  def has_Daily?
    rewards.where('created_at = ?', Date.today).first
  end 

  def user_activate!
    self.update_attributes!(active: true)
  end

  def user_desactivate!
    self.update_attributes!(active: false)
  end 
end