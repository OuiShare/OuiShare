module Admin
  class CollaborativeEconomyPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @collaborative_economy_page = DefaultAttributes.new(@collaborative_economy_page).set([:image])
      if @collaborative_economy_page.save
        redirect_to admin_collaborative_economy_pages_path
      else
        redirect_to new_admin_language_collaborative_economy_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_collaborative_economy_pages_path }
    end

    def destroy
      destroy! { admin_collaborative_economy_pages_path }
    end

    protected
    def permitted_params
      params.permit(collaborative_economy_page: [:main_text, :image, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, :title5, :text5])
    end

    def resource
      @collaborative_economy_page ||= CollaborativeEconomyPage.find(params[:id])
    end

    def build_resource
      @collaborative_economy_page = Language.find(params[:language_id]).build_collaborative_economy_page(permitted_params[:collaborative_economy_page])
    end
  end
end
