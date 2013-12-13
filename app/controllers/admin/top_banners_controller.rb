class Admin::TopBannersController < ApplicationController
  inherit_resources
  singleton_belongs_to :language
  actions :all, except: [:show, :index]

  def create
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
    params.permit(top_banner: [:title1, :text1, :title2, :text2])
  end

  def resource
    @top_banner ||= TopBanner.find(params[:id])
  end

  def build_resource
    @top_banner = Language.find(params[:language_id]).build_top_banner(permitted_params[:top_banner])
  end
end

