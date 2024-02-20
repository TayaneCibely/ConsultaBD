class AuthPageController < ApplicationController
  def index
    if verify_if_logged_in
      redirect_to home_page_index_path
    end
  end

  private

  def verify_if_logged_in
    return true if medico_signed_in?
    return true if paciente_signed_in?
    return false
  end
end