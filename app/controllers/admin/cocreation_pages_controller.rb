module Admin
  class CocreationPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @cocreation_page = DefaultAttributes.new(@cocreation_page).set([:image])
      if @cocreation_page.save
        redirect_to admin_cocreation_pages_path
      else
        redirect_to new_admin_language_cocreation_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_cocreation_pages_path }
    end

    def destroy
      destroy! { admin_cocreation_pages_path }
    end

    protected
    def permitted_params
      params.permit(cocreation_page: [:text, :image])
    end

    def resource
      @cocreation_page ||= CocreationPage.find(params[:id])
    end

    def build_resource
      @cocreation_page = Language.find(params[:language_id]).build_cocreation_page(permitted_params[:cocreation_page])
    end
  end
end
