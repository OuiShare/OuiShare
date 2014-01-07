module Admin
  class ExpertGroupsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_expert_groups_pages_path }
    end

    def update
      update! { admin_expert_groups_pages_path }
    end

    def destroy
      destroy! { admin_expert_groups_pages_path }
    end

    protected
    def permitted_params
      params.permit(expert_groups_page: [:main_text, :image])
    end

    def resource
      @expert_groups_page ||= ExpertGroupsPage.find(params[:id])
    end

    def build_resource
      @expert_groups_page = Language.find(params[:language_id]).build_expert_groups_page(permitted_params[:expert_groups_page])
    end

  end
end
