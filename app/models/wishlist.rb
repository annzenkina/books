class Wishlist < ApplicationRecord
  belongs_to :book

  def read_or_not_func
    if self.read_or_not
      result = "YES"
    else
      result = "NO"
    end
  end
end
