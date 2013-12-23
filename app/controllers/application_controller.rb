class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale
  before_filter :set_language

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_home_path
    else
      root_path
    end
  end

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << [:name, :email, :password, :password_confirmation, :bio, :facebook_url, :twitter_url, :google_plus_url, :github_url, :linkedin_url, :profile_type]
  end

  def set_locale
    if params[:locale]
      I18n.locale = params[:locale]
      current_user.update_attribute :locale, params[:locale] if current_user && params[:locale] != current_user.locale
    elsif request.method == "GET"
      new_locale = (current_user.locale if current_user) || I18n.default_locale
      redirect_to params.merge(locale: new_locale, only_path: true)
    end
  end

  def set_language
    @current_language = Language.where(slug: I18n.locale.to_s).first
  end
end

