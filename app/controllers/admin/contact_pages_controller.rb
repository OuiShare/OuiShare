module Admin
  class ContactPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @contact_page = DefaultAttributes.new(@contact_page).set()
      if @contact_page.save
        redirect_to admin_contact_pages_path
      else
        redirect_to new_admin_language_contact_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_contact_pages_path }
    end

    def destroy
      destroy! { admin_contact_pages_path }
    end

    protected
    def permitted_params
      params.permit(contact_page: [:text, :title])
    end

    def resource
      @contact_page ||= ContactPage.find(params[:id])
    end

    def build_resource
      @contact_page = Language.find(params[:language_id]).build_contact_page(permitted_params[:contact_page])
    end
  end
end
