

# Use: MagicStuff.new.save_cart

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

end
