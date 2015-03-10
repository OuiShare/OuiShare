module Admin
  class LivePagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @live_page = DefaultAttributes.new(@live_page).set([:image])
      # Note : Currently @live_page.save never works (03/10/2015)
      if @live_page.save
        redirect_to admin_live_pages_path
      else
        redirect_to new_admin_language_live_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_live_pages_path }
    end

    def destroy
      destroy! { admin_live_pages_path }
    end

    protected
    def permitted_params
      params.permit(live_page: [:main_text, :image, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4])
    end

    def resource
      @live_page ||= LivePage.find(params[:id])
    end

    def build_resource
      @live_page = Language.find(params[:language_id]).build_live_page(permitted_params[:live_page])
    end
  end
end
