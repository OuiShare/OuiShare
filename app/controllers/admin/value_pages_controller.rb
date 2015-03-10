module Admin
  class ValuePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @value_page = DefaultAttributes.new(@value_page).set([:image])
      # Note : Currently @value_page.save never works (03/10/2015)
      if @value_page.save
        redirect_to admin_value_pages_path
      else
        redirect_to new_admin_language_value_page_path(params[:language_id])
      end
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
      @value_page ||= ValuePage.find(params[:id])
    end

    def build_resource
      @value_page = Language.find(params[:language_id]).build_value_page(permitted_params[:value_page])
    end
  end
end
