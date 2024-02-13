class UsersController < Devise::RegistrationsController
  # Custom actions here

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :user_type)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :remember_me, :user_type)
    # Include :current_password to securely authenticate the user before updating their information
  end
end
