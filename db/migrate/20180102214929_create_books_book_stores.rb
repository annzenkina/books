class CreateBooksBookStores < ActiveRecord::Migration[5.1]
  def change
    create_table :books_book_stores do |t|
      t.string :id_book
      t.string :id_book_store

      t.timestamps
    end
  end
end
