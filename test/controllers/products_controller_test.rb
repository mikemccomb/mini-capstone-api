require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "images", "description", "price", "tax", "total", "is_discounted?", "created_at", "updated_at", "supplier"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { supplier_id: Supplier.first.id, name: "test", price: 10, description: "test description" }
      assert_response 200
    end

    post "/products.json", params: {}
    assert_response 422
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    # assert_equal product.price, data["price"]
    assert_equal product.description, data["description"]

    patch "/products/#{product.id}.json", params: { name: "" }
    assert_response 422
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
