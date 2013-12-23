module Admin
  class ValuePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_value_pages_path }
    end

    def update
      update! { admin_value_pages_path }
    end

    def destroy
      destroy! { admin_value_pages_path }
    end

    protected
    def permitted_params
      params.permit(value_page: [:text, :image])
    end

    def resource
      @value_page ||= Value.find(params[:id])
    end

    def build_resource
      @value_page = Language.find(params[:language_id]).build_value_page(permitted_params[:value_page])
    end
  end
end
