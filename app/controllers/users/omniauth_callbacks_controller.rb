class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def action_missing(provider)
    omniauth = env['omniauth.auth']
    if user_signed_in?
      current_user.authorizations.where(provider: omniauth['provider'],
                                        uid:      omniauth['uid']).first_or_create
      redirect_to root_path, notice: I18n.t('devise.omniauth_callbacks.success', kind: omniauth['provider'])
    else
      authorization = Authorization.where(provider: omniauth['provider'],
                                          uid:      omniauth['uid']).first
      if authorization
        flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: omniauth['provider'])
        sign_in_and_redirect(authorization.user, event: :authentication)
      else
        session[:omniauth] = omniauth
        redirect_to new_user_registration_path
      end
    end
  end
end
