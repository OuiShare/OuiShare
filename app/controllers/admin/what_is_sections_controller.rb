module Admin
  class WhatIsSectionsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @what_is_section = DefaultAttributes.new(@what_is_section).set([:image1, :image2, :image3, :image4])
      create! { admin_home_path }
    end

    def update
      update! { admin_home_path }
    end

    def destroy
      destroy! { admin_home_path }
    end

    protected
    def permitted_params
      params.permit(what_is_section: [:title, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, :image1, :image2, :image3, :image4])
    end

    def resource
      @what_is_section ||= WhatIsSection.find(params[:id])
    end

    def build_resource
      @what_is_section ||= Language.find(params[:language_id]).build_what_is_section(permitted_params[:what_is_section])
    end
  end
end
