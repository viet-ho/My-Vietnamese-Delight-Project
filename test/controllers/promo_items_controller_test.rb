require "test_helper"

class PromoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promo_item = promo_items(:one)
  end

  test "should get index" do
    get promo_items_url
    assert_response :success
  end

  test "should get new" do
    get new_promo_item_url
    assert_response :success
  end

  test "should create promo_item" do
    assert_difference("PromoItem.count") do
      post promo_items_url, params: { promo_item: { description: @promo_item.description, image: @promo_item.image, name: @promo_item.name, price: @promo_item.price } }
    end

    assert_redirected_to promo_item_url(PromoItem.last)
  end

  test "should show promo_item" do
    get promo_item_url(@promo_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_promo_item_url(@promo_item)
    assert_response :success
  end

  test "should update promo_item" do
    patch promo_item_url(@promo_item), params: { promo_item: { description: @promo_item.description, image: @promo_item.image, name: @promo_item.name, price: @promo_item.price } }
    assert_redirected_to promo_item_url(@promo_item)
  end

  test "should destroy promo_item" do
    assert_difference("PromoItem.count", -1) do
      delete promo_item_url(@promo_item)
    end

    assert_redirected_to promo_items_url
  end
end
