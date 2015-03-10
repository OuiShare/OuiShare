module Admin
  class RegistrationsPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @registration_page = DefaultAttributes.new(@registration_page).set([:image1, :image2])
      # Note : Currently @registration_page.save never works (03/10/2015) attribute nil
      if @registration_page.save
        redirect_to admin_registrations_pages_path
      else
        redirect_to new_admin_language_registrations_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_registrations_pages_path }
    end

    def destroy
      destroy! { admin_registrations_pages_path }
    end

    protected
    def permitted_params
      params.permit :utf8, :_method, :authenticity_token, :commit, :id, :language_id, registration_page: [:id, :main_title, :main_text, :thanks_text, :image1, :title1, :text1, :image2, :title2, :text2, :main_text2, :link1, :text3, :link2] 
    end

    def resource
      @registration_page ||= RegistrationPage.find(params[:id])
    end

    def build_resource
      @registration_page = Language.find(params[:language_id]).build_registration_page(permitted_params[:registration_page])
    end

  end
end
