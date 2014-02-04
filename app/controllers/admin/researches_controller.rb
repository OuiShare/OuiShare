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

    protected
    def permitted_params
      params.permit(research: [:title, :image, :text, :link, :tag_list, :language_id])
    end

  end
end
