module Admin
  class UsersController < BaseController
    inherit_resources

    before_filter :verify_admin, except: :show

    def update
      update! { admin_users_path }
    end

    protected
    def permitted_params
      params.permit(user: [:fname, :name, :email_address, :country, :language_id, :occupation_id, :organization_url, :organization_name, :gender, :city, :email, :title, :bio, :image, :facebook_url, :twitter_url, :google_plus_url, :github_url, :linkedin_url, :tag_list, :profile_type, :admin, :show_order])
    end
  end
end
