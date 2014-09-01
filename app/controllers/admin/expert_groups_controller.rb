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

    def sort
      resource.update_attribute :row_order_position, params[:expert_group][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(expert_group: [:name, :link, :text, :language_id, :row_order_position, :user_ids => []])
    end

  end
end
