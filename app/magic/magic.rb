

# Use: Magic.new.save_cart
#      Magic.new.create_order

class Magic

  # save_cart you would do as save_cart(params)
  # params just needs to be a hash of whatever
  # values you need to populate the cart. In
  # this example, you would pass the venue object
  # and the products object. This information
  # could be obtained from one of the backbars
  # views, they select the qty for a product
  # they previously added to their backbar, and
  # then when they submit the form, it will
  # pass those params to save_cart and let
  # it do it's thing.... 

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


  # you would want to do something like create_order(cart)
  # and do your query outside this object. So maybe in your
  # controller, you'd have:
  # cart = Venue.carts.first
  # Magic.new.create_order(cart)

  def create_order
    cart = Cart.last # you would remove this since you're passing cart on the call
    products = cart.products
    price = []

    # iterate over each product and get the price to sum for total
    products.each do |item|
      price << item[1]['price'] * item[1]['quantity']
    end
    total = price.inject(0, &:+)

    # before you do the final Order.create, you would at this point want to
    # run whatever 3rd party transactios you have, such as posting a
    # transaction to the OrderWise system. Then, pending the success,
    # you can then create the order record.

    Order.create(venue_id: cart.venue_id, total: total, products: cart.products)
  end

end
