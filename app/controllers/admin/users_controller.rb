module Admin
  class UsersController < BaseController
    inherit_resources

    before_filter :verify_admin, except: :show
    def index
      @users = User.all
      # respond_to do |format|
      #   format.html
      #   format.csv  { render csv: @users, only: [:id, :fname, :name, :gender, :email, :created_at, :admin, :birthday, :country, :city, :organization_name, :organization_url] }
      # end
      respond_to do |format|
        format.html
        format.json { render json: UserDatatable.new(view_context) }
        format.csv  { render csv: @users, only: [:id, :fname, :name, :gender, :email, :created_at, :admin, :birthday, :country, :city, :organization_name, :organization_url] }
      end
    end

    def show
      @user = User.friendly.find(params[:id])
        if @user.nil?
          redirect_to '/errors/404', :code => '404'
        else
          @user_topics = @user.topics
          @user_interests = @user.tag_list
          @user_skills = @user.skill_list
        end
    end

    def update
      @user = User.friendly.find(params[:id])
      params[:user][:slug] = nil
      if @user.update_attributes(permitted_params)
        redirect_to admin_users_path, notice: 'User updated.'
      else
        params[:user][:slug] = params[:id]
        redirect_to :back, alert: 'User NOT updated.'
      end
    end

    def edit
      @user = User.friendly.find(params[:id])
    end


    protected
    def permitted_params
      params.require(:user).permit(:fname, :name, :slug, :email_address, :country, :language_id, :occupation_id, :organization_url, :organization_name, :gender, :city, :email, :title, :bio, :image, :facebook_url, :twitter_url, :google_plus_url, :github_url, :linkedin_url, :skills, :tag_list, :profile_type, :admin, :show_order, :contact_languages)
    end
  end
end
