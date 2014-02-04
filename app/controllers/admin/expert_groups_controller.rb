module Admin
  class ExpertGroupsController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_expert_groups_path }
    end

    def update
      update! { admin_expert_groups_path }
    end

    def destroy
      destroy! { admin_expert_groups_path }
    end

    def show
      @expert_group = ExpertGroup.find(params[:id])
    end

    protected
    def permitted_params
      params.permit(expert_group: [:name, :link, :text, :language_id, :user_ids => []])
    end

  end
end
