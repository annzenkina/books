require 'test_helper'

class WishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @wishlist = wishlists(:one)
  end

  test "wishlist_index can add a book" do
    Book.create(id: "222", title: "Murderer")

    assert_difference "Wishlist.count", +1 do
      get wishlists_url(wishlist: "222")
    end
    assert_redirected_to wishlists_url

    assert_equal "The book was successfully added to WishList.", flash[:notice]
  end

  test "should get index" do
    get wishlists_url
    assert_response :success
  end

  test "should get new" do
    get new_wishlist_url
    assert_response :success
  end

  # test "should create wishlist" do
  #   assert_difference('Wishlist.count') do
  #     post wishlists_url, params: { wishlist: { book_id: @wishlist.book_id, read_or_not: @wishlist.read_or_not } }
  #   end
  #
  #   assert_redirected_to wishlist_url(Wishlist.last)
  # end
  #
  # test "should show wishlist" do
  #   get wishlist_url(@wishlist)
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get edit_wishlist_url(@wishlist)
  #   assert_response :success
  # end
  #
  # test "should update wishlist" do
  #   patch wishlist_url(@wishlist), params: { wishlist: { book_id: @wishlist.book_id, read_or_not: @wishlist.read_or_not } }
  #   assert_redirected_to wishlist_url(@wishlist)
  # end

  # test "should destroy wishlist" do
  #   assert_difference('Wishlist.count', -1) do
  #     delete wishlist_url(@wishlist)
  #   end
  #
  #   assert_redirected_to wishlists_url
  # end
end
