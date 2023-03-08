class Image < ApplicationRecord
  def products
    Product.where(image_id: id)
  end
end
