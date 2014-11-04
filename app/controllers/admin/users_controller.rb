module Admin
  class UsersController < BaseController
    inherit_resources

    before_filter :verify_admin, except: :show
    def index
      @users = User.all
      respond_to do |format|
        format.html
        format.csv  { render csv: @users, only: [:id, :fname, :name, :gender, :email, :created_at, :admin, :birthday, :country, :city, :organization_name, :organization_url] }
      end
    end

    def show
      user_id = params[:id]
      @user = User.find_by_id(user_id)
        if @user.nil?
          redirect_to '/errors/404', :code => '404'
        else
          @user_topics = @user.topics
          @user_occupation = @user.occupation
        end
    end

    def update
      update! { admin_users_path }
    end

    protected
    def permitted_params
      params.permit(user: [:fname, :name, :email_address, :country, :language_id, :occupation_id, :organization_url, :organization_name, :gender, :city, :email, :title, :bio, :image, :facebook_url, :twitter_url, :google_plus_url, :github_url, :linkedin_url, :tag_list, :profile_type, :admin, :show_order])
    end
  end
end
