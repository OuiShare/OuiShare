module Admin
  class ResearchesController < BaseController
    inherit_resources
    belongs_to :language

    def index
    end

    def create
      create! { admin_researches_path }
    end

    def update
      update! { admin_researches_path }
    end

    def destroy
      destroy! { admin_researches_path }
    end

    def show
      @research = Research.find(params[:id])
    end

    def sort
      resource.update_attribute :row_order_position, params[:research][:row_order_position]

      render nothing: true
    end

    protected
    def permitted_params
      params.permit(research: [:title, :image, :text, :link, :row_order_position, :tag_list, :language_id])
    end

  end
end
