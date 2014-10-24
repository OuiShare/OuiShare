module Admin
  class UsersPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @users_page = DefaultAttributes.new(@users_page).set()
      if @users_page.save
        redirect_to admin_users_pages_path
      else
        redirect_to new_admin_language_users_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_users_pages_path }
    end

    def destroy
      destroy! { admin_users_pages_path }
    end

    protected
    def permitted_params
      params.permit(users_page: [:title, :text, :link_text])
    end

    def resource
      @users_page ||= UsersPage.find(params[:id])
    end

    def build_resource
      @users_page = Language.find(params[:language_id]).build_users_page(permitted_params[:users_page])
    end
  end
end
