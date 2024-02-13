class ApplicationController < ActionController::Base
  include Pundit

  # Resgate de erro Pundit para permissões negadas
  rescue_from Pundit::NotAuthorizedError, with: :usuario_nao_autorizado

  private

  def usuario_nao_autorizado(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

end
