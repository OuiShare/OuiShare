module Admin
  class ArticlesSectionsController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @articles_section = DefaultAttributes.new(@articles_section).set()
      if @articles_section.save
        redirect_to admin_home_path
      else
        render new_admin_articles_section_path
      end
    end

    def update
      update! { admin_home_path }
    end

    def destroy
      destroy! { admin_home_path }
    end

    protected
    def permitted_params
      params.permit(articles_section: [:title, :text, :link_text])
    end

    def resource
      @articles_section ||= ArticlesSection.find(params[:id])
    end

    def build_resource
      @articles_section = Language.find(params[:language_id]).build_articles_section(permitted_params[:articles_section])
    end
  end
end
