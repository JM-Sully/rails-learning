require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    #put something in the cart
    visit store_index_url
    click_on "Add to Cart", match: :first

    click_on "Checkout"

    fill_in "Address", with: @order.address
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    select 'Purchase order', from: 'Pay type'
    fill_in "PO #", with: '12341234'
    click_on "Place Order"

    assert_text "Thank you for your order."
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @order.address
    fill_in "Email", with: @order.email
    fill_in "Name", with: @order.name
    fill_in "Pay type", with: @order.pay_type
    click_on "Place Order"

    assert_text "Order was successfully updated"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end