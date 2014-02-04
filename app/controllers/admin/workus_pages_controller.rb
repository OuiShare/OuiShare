module Admin
  class WorkusPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_workus_pages_path }
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
