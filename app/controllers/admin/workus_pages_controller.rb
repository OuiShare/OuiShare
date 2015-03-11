module Admin
  class WorkusPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @workus_page = DefaultAttributes.new(@workus_page).set([:image])
      if @workus_page.save
        redirect_to admin_workus_pages_path
      else
        redirect_to new_admin_language_workus_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_workus_pages_path }
    end

    def destroy
      destroy! { admin_workus_pages_path }
    end

    protected
    def permitted_params
      params.permit(workus_page: [:text, :image])
    end

    def resource
      @workus_page ||= WorkusPage.find(params[:id])
    end

    def build_resource
      @workus_page = Language.find(params[:language_id]).build_workus_page(permitted_params[:workus_page])
    end
  end
end
