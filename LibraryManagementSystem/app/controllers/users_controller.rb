class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json

  def index
    if current_user.usertype == "admin"
      @users = User.all
    else
      @users = User.where("id = ?", current_user.id)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @libraries = []
    if params[:university_id].present?
      @libraries = University.find(params[:university_id]).libraries
    end
    if request.xhr?
      respond_to do |format|
        format.json {
          render json: {libraries: @libraries}
        }
      end
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html {redirect_to current_user, notice: 'User was successfully created.'}
        format.json {render :show, status: :created, location: @user}
      else
        format.html {render :new}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    respond_to do |format|
      if @user.usertype == "admin"
        format.html {redirect_to users_url, notice: 'Admin account cannot be deleted'}
        format.json {head :no_content}
      else
      @user.destroy
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_user
      if params[:id] != 'sign_out'
        @user = User.find(params[:id])
      end
    end

    def user_params
      params.require(:user).permit(:name, :password, :email, :usertype, :university_id, :library_id)
    end
end
