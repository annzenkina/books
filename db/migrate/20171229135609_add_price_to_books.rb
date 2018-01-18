class AddPriceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column "BX-Books", :price, :decimal
  end
end
