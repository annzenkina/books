class AddReadDateToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :read_books, :read_date, :date

    ReadBook.all.each do |book|
      book.update(read_date: book.created_at.to_date)
    end
  end
end
