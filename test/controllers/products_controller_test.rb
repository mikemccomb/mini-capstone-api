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
    assert_equal ["id", "name", "images", "description", "supplier", "categories", "price", "tax", "total", "is_discounted?", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json",
           params: { supplier_id: Supplier.first.id, name: "test", price: 1, description: "test description", admin: true },
           headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json",
          params: { name: "Updated name", admin: true },
          headers: { "Authorization" => "Bearer #{@jwt}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal product.description, data["description"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json"
      assert_response 200
    end
  end
end
