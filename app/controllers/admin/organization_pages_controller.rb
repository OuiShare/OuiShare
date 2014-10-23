module Admin
  class OrganizationPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @organization_page = DefaultAttributes.new(@organization_page).set([:image])
      if @organization_page.save
        redirect_to admin_organization_pages_path
      else
        redirect_to new_admin_language_organization_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_organization_pages_path }
    end

    def destroy
      destroy! { admin_organization_pages_path }
    end

    protected
    def permitted_params
      params.permit(organization_page: [:main_text, :image, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4])
    end

    def resource
      @organization_page ||= OrganizationPage.find(params[:id])
    end

    def build_resource
      @organization_page = Language.find(params[:language_id]).build_organization_page(permitted_params[:organization_page])
    end
  end
end
