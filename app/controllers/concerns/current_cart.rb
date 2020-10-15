module CurrentCart

    private

        def set_cart
            @cart = Cart.fin(session[cart_id])
        rescue ActiveRecord::RecordNptFound
            @cart =Cart.create
            session[:cart_id] =@cart.cart.cart.id
        end
end