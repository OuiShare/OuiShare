module Admin
  class BaseController < ApplicationController
    before_filter :verify_editor
    private
    def verify_editor
      unless current_user.try(:has_edit_rights?) || (params[:controller] == "admin/users" && params[:action] == 'show')
        if user_signed_in?
          redirect_to root_path, alert: t('admin.not_authorized')
        else
          redirect_to new_user_session_path
        end
      end
    end
  end
end
