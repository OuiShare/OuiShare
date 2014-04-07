module Admin
  class GovernancesController < BaseController
    inherit_resources
    belongs_to :language

    before_filter :verify_admin

    def index
    end

    def create
      create! { admin_governances_path }
    end

    def update
      update! { admin_governances_path }
    end

    def destroy
      destroy! { admin_governances_path }
    end

    def show
      @governance = Governance.find(params[:id])
      render 'admin/governances/show'
    end

    protected
    def permitted_params
      params.permit(governance: [:name, :link, :text, :language_id])
    end

  end
end
