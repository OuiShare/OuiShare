module Admin
  class GetInvolvedPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_get_involved_pages_path }
    end

    def update
      update! { admin_get_involved_pages_path }
    end

    def destroy
      destroy! { admin_get_involved_pages_path }
    end

    protected
    def permitted_params
      params.permit(get_involved_page: [:main_text, :image, :title1, :text1, :link1, :link1_text, :title2, :text2, :link2, :link2_text, :title3, :text3, :link3, :link3_text, :title4, :text4, :link4, :link4_text, :title5, :text5, :link5, :link5_text, :title6, :text6, :link6, :link6_text, :title7, :text7, :link7, :link7_text])
    end

    def resource
      @get_involved_page ||= GetInvolvedPage.find(params[:id])
    end

    def build_resource
      @get_involved_page = Language.find(params[:language_id]).build_get_involved_page(permitted_params[:get_involved_page])
    end
  end
end
