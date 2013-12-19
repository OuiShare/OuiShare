class Admin::CommunityPagesController < BaseController
  inherit_resources
  singleton_belongs_to :language
  actions :all, except: [:show, :index]

  def create
    create! { admin_community_pages_path }
  end

  def update
    update! { admin_community_pages_path }
  end

  def destroy
    destroy! { admin_community_pages_path }
  end

  protected
  def permitted_params
    params.permit(community_page: [:main_text, :image])
  end

  def resource
    @community_page ||= CommunityPage.find(params[:id])
  end

  def build_resource
    @community_page = Language.find(params[:language_id]).build_community_page(permitted_params[:community_page])
  end

end
