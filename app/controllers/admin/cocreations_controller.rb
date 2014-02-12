module Admin
  class CocreationsController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_cocreations_path }
    end

    def update
      update! { admin_cocreations_path }
    end

    def destroy
      destroy! { admin_cocreations_path }
    end

    def show
      @cocreation = Cocreation.find(params[:id])
      render 'admin/cocreations/show'
    end

    protected
    def permitted_params
      params.permit(cocreation: [:name, :link, :text, :image, :language_id])
    end

  end
end
