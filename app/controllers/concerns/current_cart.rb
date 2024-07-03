module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
    puts @cart.inspect
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    puts session[:cart_id].inspect
    puts @cart.inspect
  end
end
