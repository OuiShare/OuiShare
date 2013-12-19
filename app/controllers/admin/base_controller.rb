module Admin
  class BaseController < ApplicationController
    before_filter :verify_admin
    private
    def verify_admin
      redirect_to new_user_session_path unless current_user.try(:admin?)
    end
  end
end
