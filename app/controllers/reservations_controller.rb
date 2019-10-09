class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :get_library
  before_action :get_university
  before_action :get_index_type, only: [:index]
  before_action :validate_checkout, only: [:create, :update]
  after_action :notify_next, only: [:update]
  # Reservation status
  # 0 => Returned
  # 1 => Checked out
  # 2 => Requested
  # 5$ fine on each day


  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = []
    @library.lib_books.each do |lib_book|
      lib_book.reservations.each do |reservation|
        if @category.eql?"overdue"
          calculate_fine(reservation)
          if !reservation.fine.eql?nil and reservation.fine > 0
            add_reservation_to_index(reservation)
          end
        elsif @category.eql?"current"
          if reservation.status == 1
            calculate_fine(reservation)
            add_reservation_to_index(reservation)
          end
        elsif @category.eql?"requested"
          if reservation.status == 2
            add_reservation_to_index(reservation)
          end
        else #All
          calculate_fine(reservation)
          add_reservation_to_index(reservation)
        end
      end
    end
    # @library.lib_books
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.status == 1
      @reservation.checkoutstamp = Time.now()
    elsif @reservation.status == 2
      @reservation.requeststamp = Time.now()
    elsif @reservation.status == 3
      @reservation.returnstamp = Time.now()
    end
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to university_library_reservations_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to university_library_reservations_path, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to university_library_reservations_path, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:lib_book_id, :user_id, :status, :checkoutstamp, :returnstamp, :requeststamp)
    end

    def get_library
      @library = Library.find(params[:library_id])
    end

    def get_university
      @university = University.find(params[:university_id])
    end

    def get_index_type
      if params[:category].eql?nil
        @category = "all"
      else
        @category = params[:category]
      end
    end

    def calculate_fine(reservation)
      if reservation.status == 0 || reservation.status == 1
        total_days = (reservation.status == 1) ?
                         (Date.parse(Time.now.to_s) - Date.parse(reservation.checkoutstamp.to_s)).to_i
                         : (Date.parse(reservation.returnstamp.to_s) - Date.parse(reservation.checkoutstamp.to_s)).to_i
        extra_days = 0
        allowed_days = @library.max_days
        if total_days > allowed_days
          extra_days = total_days - allowed_days
        end
        reservation.fine = extra_days * @library.fine
      end
    end

    def add_reservation_to_index(reservation)
      if current_user.usertype == "admin" || current_user.usertype == "librarian"
        @reservations.push(reservation)
      else
        if reservation.user_id.eql? current_user.id
          @reservations.push(reservation)
        end
      end
    end

    def validate_checkout
      #Only if check-out is attempted
      if reservation_params[:status].eql?"1"
        @book_limit = -1
        @student_type = ""
        if current_user.usertype == 'librarian' || current_user.usertype == 'admin'
          @student = User.find_by_id(@reservation.user_id)
          @student_type = @student.usertype
          @num_existing_reservations = Reservation.where(:user_id => @student.id).where(:status => 1).count()
        else
          @num_existing_reservations = Reservation.where(:user_id => current_user.id).where(:status => 1).count()
        end
        if current_user.usertype == 'studentUG' || @student_type == 'studentUG'
          @book_limit = @university.ug_books_limit
        elsif current_user.usertype == 'studentG' || @student_type == 'studentG'
          @book_limit = @university.grad_books_limit
        elsif current_user.usertype == 'studentPhD' || @student_type == 'studentPhD'
          @book_limit = @university.phd_books_limit
        end
        if @num_existing_reservations >= @book_limit
          redirect_to university_library_lib_books_path, :notice => "Can't checkout the book, max limit (" + @book_limit.to_s + ") for checking out books reached"
        end
      end
    end

    def notify_next
      #Only if book is returned
      if reservation_params[:status].eql?"0"
        @next_requester_query = Reservation.where(:status => 2).where(:lib_book => reservation_params[:lib_book_id]).order(:requeststamp)
        @next_requester_query.all.each do |next_requester|
          if !next_requester.eql?nil
            num_existing_reservations = Reservation.where(:user_id => next_requester.user_id).where(:status => 1).count()
            next_requester_user = User.find_by_id(next_requester.user_id)
            next_requester_university = University.find(next_requester_user.university_id)
            if next_requester_user.usertype == 'studentUG'
              next_requester_book_limit = next_requester_university.ug_books_limit
            elsif next_requester_user.usertype == 'studentG'
              next_requester_book_limit = next_requester_university.grad_books_limit
            elsif next_requester_user.usertype == 'studentPhD'
              next_requester_book_limit = next_requester_university.phd_books_limit
            end
            if num_existing_reservations < next_requester_book_limit
              next_requester.update(:checkoutstamp => Time.now(), :status => 1)
              @book_title = Book.find(LibBook.find(reservation_params[:lib_book_id]).book_id).title
              UserMailer.mailer(next_requester_user.email, next_requester_user.name, @book_title, @library.name).deliver
              break
            end
          end
        end
      end
    end
end
