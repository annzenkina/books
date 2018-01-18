class Book < ApplicationRecord
  self.table_name = "BX-Books"

  has_many :read_book
  has_many :wishlist
end
