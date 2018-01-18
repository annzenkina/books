require 'test_helper'

class ReadBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "should get index" do
    get read_books_url
    assert_response :success
  end

  test "index can add read book" do
    Book.create!(id: "123", title: "Myreadbook")

    assert_difference "ReadBook.count", +1 do
      get read_books_url(read_book: "123")
    end
    assert_redirected_to read_books_url

    assert_equal "The read book was successfully added!", flash[:notice]
  end

  test "should get new" do
    get new_read_book_url
    assert_response :success
  end

  # test "should create read_book" do
  #   assert_difference('ReadBook.count') do
  #     post read_books_url, params: { read_book: { book_id: @read_book.book_id } }
  #   end
  #
  #   assert_redirected_to read_book_url(ReadBook.last)
  # end

  # test "should show read_book" do
  #   get read_book_url(@read_book)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_read_book_url(@read_book)
  #   assert_response :success
  # end

  # test "should update read_book" do
  #   patch read_book_url(@read_book), params: { read_book: { book_id: @read_book.book_id } }
  #   assert_redirected_to read_book_url(@read_book)
  # end

  # test "should destroy read_book" do
  #   assert_difference('ReadBook.count', -1) do
  #     delete read_book_url(@read_book)
  #   end
  #
  #   assert_redirected_to read_books_url
  # end
end
