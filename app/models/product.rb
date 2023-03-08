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

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images
  # def image
  #   Image.find_by(id: image_id)
  # end

  # validates :name, presence: true, uniqueness: true, length: { maximum: 12 }
  # validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :description, presence: true, length: { in: 10..500 }
  # validates :inventory, presence: true, numericality: { greater_than: 0 }
end
