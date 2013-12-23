module Admin
  class UsersController < BaseController
    inherit_resources

    def update
      update! { admin_users_path }
    end

    protected
    def permitted_params
      params.permit(user: [:profile_type, :admin])
    end
  end
end
