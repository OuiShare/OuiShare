module Admin
  class UsersController < BaseController
    inherit_resources

    def update
      update! { admin_users_path }
    end

    protected
    def permitted_params
      params.permit(user: [:name, :title, :bio, :image, :facebook_url, :twitter_url, :google_plus_url, :github_url, :linkedin_url, :tag_list, :profile_type, :admin])
    end
  end
end
