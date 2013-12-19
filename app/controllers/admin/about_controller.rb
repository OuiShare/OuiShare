module Admin
  class AboutController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    def create
      create! { admin_about_path }
    end

    def update
      update! { admin_about_path }
    end

    def destroy
      destroy! { admin_about_path }
    end

    protected
    def permitted_params
      params.permit(about: [:main_title, :main_text1, :main_text2, :image, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4])
    end

    def resource
      @about ||= About.find(params[:id])
    end

    def build_resource
      @about = Language.find(params[:language_id]).build_about(permitted_params[:about])
    end
  end
end
