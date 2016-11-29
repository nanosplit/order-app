class Venue < ApplicationRecord
  has_many :carts
  has_many :backbars
  has_many :orders
end
