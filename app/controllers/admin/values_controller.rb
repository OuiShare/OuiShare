module Admin
  class ValuesController < BaseController
    inherit_resources
    belongs_to :language

    before_filter :verify_admin

    def index
    end

    def create
      create! { admin_values_path }
    end

    def update
      update! { admin_values_path }
    end

    def destroy
      destroy! { admin_values_path }
    end

    def show
      @value = Value.find(params[:id])
      render 'admin/values/show'
    end

    protected
    def permitted_params
      params.permit(value: [:name, :link, :text, :language_id])
    end

  end
end
