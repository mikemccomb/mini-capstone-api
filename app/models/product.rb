class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products


  def is_discounted?
    price <= 10 ? true : false
  end

  def subtotal
    subtotal = price * @order.quantity
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end

end
