module Admin
  class ContactPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_contact_pages_path }
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
