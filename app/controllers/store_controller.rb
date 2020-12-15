class StoreController < ApplicationController
  def index
    @products = Product.order(:title)

    @time = Time.now.strftime("Today is %b %dth")
  end

end
