module Admin
  class ExpertGroupsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @expert_groups_page = DefaultAttributes.new(@expert_groups_page).set([:image])
      # Note : Currently @expert_groups_page.save never works (03/10/2015)
      if @expert_groups_page.save
        redirect_to admin_expert_groups_pages_path
      else
        redirect_to new_admin_language_expert_groups_page_path(params[:language_id])
      end
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
