module Admin
  class ServicesController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_services_path }
    end

    def update
      update! { admin_services_path }
    end

    def destroy
      destroy! { admin_services_path }
    end

    def show
      @service = Service.find(params[:id])
    end

    protected
    def permitted_params
      params.permit(service: [:name, :image, :text, :link, :language_id])
    end

  end
end
