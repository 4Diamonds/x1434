class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :package
  attr_accessible :paid, :return, :value, :package_id, :gateway, :user

  scope :paid, where(paid: true)
  
  def pagseguro?
    gateway == 'pagseguro'
  end

  def paypal?
    gateway == 'paypal'
  end

  GATEWAYS = {"PagSeguro" => :pagseguro, "PayPal" => :paypal}

  def order_paid!
    self.update_attributes!(paid: true)
  end

  def order_unpaid!
    self.update_attributes!(paid: false)
  end 

  after_create do |order|
    order.update_attributes(value: package.value)
  end

end
