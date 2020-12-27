class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    @time = Time.now.strftime("Today is %b %dth")
  end

end
