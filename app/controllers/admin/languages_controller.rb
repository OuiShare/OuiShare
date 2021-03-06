module Admin
  class LanguagesController < BaseController
    inherit_resources

    before_filter :verify_admin

    def update
      update! { admin_languages_path }
    end

    def create
      create! { admin_languages_path }
    end

    protected
    def permitted_params
      params.permit(language: [:name, :english_name, :slug, :visible])
    end
  end
end
