class Product < ApplicationRecord
  def is_discounted?
    price <= 10 ? true : false
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end

  belongs_to :supplier
  has_many :images
  has_many :orders
end
