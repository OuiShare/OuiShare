module Admin
  class BaseController < ApplicationController
    before_filter :verify_admin
    private
    def verify_admin
      unless current_user.try(:admin?)
        if user_signed_in?
          redirect_to root_path, alert: t('admin.not_authorized')
        else
          redirect_to new_user_session_path
        end
      end
    end
  end
end
