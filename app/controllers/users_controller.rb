# User Controller
class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :find_user,     only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /user/1
  def show
  end

  # GET /user/1/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Herzlich Willkommen, auf der Homepage der Firma RA-GAS GmbH"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /user/1
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profil wurde aktualisiert"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DESTROY /user/1
  def destroy
    @user.destroy unless current_user?(@user)
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Callback to check the user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Callback to check the users group.
    # Only valid if user is an admin.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
