require "application_system_test_case"

class LibBooksTest < ApplicationSystemTestCase
  setup do
    @lib_book = lib_books(:one)
  end

  test "visiting the index" do
    visit lib_books_url
    assert_selector "h1", text: "Lib Books"
  end

  test "creating a Lib book" do
    visit lib_books_url
    click_on "New Lib Book"

    fill_in "Book", with: @lib_book.book_id
    fill_in "Library", with: @lib_book.library_id
    fill_in "Quantity", with: @lib_book.quantity
    click_on "Create Lib book"

    assert_text "Lib book was successfully created"
    click_on "Back"
  end

  test "updating a Lib book" do
    visit lib_books_url
    click_on "Edit", match: :first

    fill_in "Book", with: @lib_book.book_id
    fill_in "Library", with: @lib_book.library_id
    fill_in "Quantity", with: @lib_book.quantity
    click_on "Update Lib book"

    assert_text "Lib book was successfully updated"
    click_on "Back"
  end

  test "destroying a Lib book" do
    visit lib_books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lib book was successfully destroyed"
  end
end
