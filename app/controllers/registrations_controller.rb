class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.user_type = params[:user][:user_type]
      resource.save
    end
  end
end
