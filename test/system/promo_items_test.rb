require "application_system_test_case"

class PromoItemsTest < ApplicationSystemTestCase
  setup do
    @promo_item = promo_items(:one)
  end

  test "visiting the index" do
    visit promo_items_url
    assert_selector "h1", text: "Promo items"
  end

  test "should create promo item" do
    visit promo_items_url
    click_on "New promo item"

    fill_in "Description", with: @promo_item.description
    fill_in "Image", with: @promo_item.image
    fill_in "Name", with: @promo_item.name
    fill_in "Price", with: @promo_item.price
    click_on "Create Promo item"

    assert_text "Promo item was successfully created"
    click_on "Back"
  end

  test "should update Promo item" do
    visit promo_item_url(@promo_item)
    click_on "Edit this promo item", match: :first

    fill_in "Description", with: @promo_item.description
    fill_in "Image", with: @promo_item.image
    fill_in "Name", with: @promo_item.name
    fill_in "Price", with: @promo_item.price
    click_on "Update Promo item"

    assert_text "Promo item was successfully updated"
    click_on "Back"
  end

  test "should destroy Promo item" do
    visit promo_item_url(@promo_item)
    click_on "Destroy this promo item", match: :first

    assert_text "Promo item was successfully destroyed"
  end
end
