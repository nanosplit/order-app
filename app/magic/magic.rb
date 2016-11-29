

# Use: Magic.new.save_cart
#      Magic.new.create_order

class Magic

  def save_cart
    venue = Venue.first
    products = Product.all

    hash = {}
    n = 0

    products.each do |item|
      qty = rand(3..25)
      a = { n => {
              :product_name => item.name,
              :venue_id => item.id,
              :quantity => qty,
              :price => item.price
            }
          }
      hash.merge!(a)
      n += 1
    end

    Cart.create(venue_id: venue.id, products: hash)
  end

  def create_order
    cart = Cart.last
    products = cart.products
    price = []

    products.each do |item|
      price << item[1]['price'] * item[1]['quantity']
    end
    total = price.inject(0, &:+)

    Order.create(venue_id: cart.venue_id, total: total, products: cart.products)
  end

end
