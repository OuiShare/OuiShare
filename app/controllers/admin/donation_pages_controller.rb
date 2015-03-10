module Admin
  class DonationPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @donation_page = DefaultAttributes.new(@donation_page).set([:image1, :image2])
      # Note : Currently @donation_page.save never works (03/10/2015)
      if @donation_page.save
        redirect_to admin_donation_pages_path
      else
        redirect_to new_admin_language_donation_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_donation_pages_path }
    end

    def destroy
      destroy! { admin_donation_pages_path }
    end

    protected
    def permitted_params
      params.permit(donation_page: [:main_title, :main_text, :thanks_text, :image1, :title1, :text1, :image2, :title2, :text2])
    end

    def resource
      @donation_page ||= DonationPage.find(params[:id])
    end

    def build_resource
      @donation_page = Language.find(params[:language_id]).build_donation_page(permitted_params[:donation_page])
    end

  end
end
