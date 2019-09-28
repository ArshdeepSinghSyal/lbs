class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: :cancel
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :usertype)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :usertype)
  end
end