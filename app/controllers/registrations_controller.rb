class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.user_type = params[:user][:user_type]
      resource.save
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :user_type)
  end
end
