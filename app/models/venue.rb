class Venue < ApplicationRecord
  has_many :carts
  has_many :backbars
end
