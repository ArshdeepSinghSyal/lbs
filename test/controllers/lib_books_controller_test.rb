require 'test_helper'

class LibBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lib_book = lib_books(:one)
  end

  test "should get index" do
    get lib_books_url
    assert_response :success
  end

  test "should get new" do
    get new_lib_book_url
    assert_response :success
  end

  test "should create lib_book" do
    assert_difference('LibBook.count') do
      post lib_books_url, params: { lib_book: { book_id: @lib_book.book_id, library_id: @lib_book.library_id, quantity: @lib_book.quantity } }
    end

    assert_redirected_to lib_book_url(LibBook.last)
  end

  test "should show lib_book" do
    get lib_book_url(@lib_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_lib_book_url(@lib_book)
    assert_response :success
  end

  test "should update lib_book" do
    patch lib_book_url(@lib_book), params: { lib_book: { book_id: @lib_book.book_id, library_id: @lib_book.library_id, quantity: @lib_book.quantity } }
    assert_redirected_to lib_book_url(@lib_book)
  end

  test "should destroy lib_book" do
    assert_difference('LibBook.count', -1) do
      delete lib_book_url(@lib_book)
    end

    assert_redirected_to lib_books_url
  end
end
