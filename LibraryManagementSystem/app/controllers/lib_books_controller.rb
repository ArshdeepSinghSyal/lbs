class LibBooksController < ApplicationController
  before_action :set_lib_book, only: [:show, :edit, :update, :destroy]
  before_action(:get_library)
  before_action(:get_university)

  # GET /lib_books
  # GET /lib_books.json
  def index
    @lib_books = @library.lib_books
  end

  # GET /lib_books/1
  # GET /lib_books/1.json
  def show
  end

  # GET /lib_books/new
  def new
    @lib_book = LibBook.new
  end

  # GET /lib_books/1/edit
  def edit
  end

  # POST /lib_books
  # POST /lib_books.json
  def create
    @lib_book = LibBook.new(lib_book_params)

    respond_to do |format|
      if @lib_book.save
        format.html { redirect_to university_library_lib_books_path, notice: 'Lib book was successfully created.' }
        format.json { render :show, status: :created, location: @lib_book }
      else
        format.html { render :new }
        format.json { render json: @lib_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lib_books/1
  # PATCH/PUT /lib_books/1.json
  def update
    respond_to do |format|
      if @lib_book.update(lib_book_params)
        format.html { redirect_to university_library_lib_books_path, notice: 'Lib book was successfully updated.' }
        format.json { render :show, status: :ok, location: @lib_book }
      else
        format.html { render :edit }
        format.json { render json: @lib_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lib_books/1
  # DELETE /lib_books/1.json
  def destroy
    @lib_book.destroy
    respond_to do |format|
      format.html { redirect_to university_library_lib_books_path, notice: 'Lib book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lib_book
      @lib_book = LibBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lib_book_params
      params.require(:lib_book).permit(:library_id, :book_id, :quantity)
    end

    def get_library
      @library = Library.find(params[:library_id])
    end

    def get_university
      @university = University.find(params[:university_id])
    end
end
