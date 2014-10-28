module Admin
  class AlumniPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @alumni_page = DefaultAttributes.new(@alumni_page).set()
      if @alumni_page.save
        redirect_to admin_alumni_pages_path
      else
        redirect_to new_admin_language_alumni_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_alumni_pages_path }
    end

    def destroy
      destroy! { admin_alumni_pages_path }
    end

    protected
    def permitted_params
      params.permit(alumni_page: [:title, :text, :link_text])
    end

    def resource
      @alumni_page ||= AlumniPage.find(params[:id])
    end

    def build_resource
      @alumni_page = Language.find(params[:language_id]).build_alumni_page(permitted_params[:alumni_page])
    end
  end
end
