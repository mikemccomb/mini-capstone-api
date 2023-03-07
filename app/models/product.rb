class Product < ApplicationRecord
  # You don't need product.method because you are already in the Product class
  def is_discounted?
    price <= 10 ? true : false
  end

  def tax
    tax = price * 0.09
  end

  def total
    total = price + tax
  end

  validates :name, presence: true, uniqueness: true, length: { maximum: 12 }
end
