require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  # ######################## NEWLY ADDED TEST CASES ######################
     test "should have valid name" do
      b = Book.new
      b.name = "Giuerh"
      assert b.save
    end

    test "valid name not present" do
      b = Book.new
      assert_not b.save
    end
end
