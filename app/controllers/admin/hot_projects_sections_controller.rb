class Admin::HotProjectsSectionsController < ApplicationController
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
    params.permit(hot_projects_section: [:title, :text, :link_text])
  end

  def resource
    @hot_projects_section ||= HotProjectsSection.find(params[:id])
  end

  def build_resource
    @hot_projects_section = Language.find(params[:language_id]).build_hot_projects_section(permitted_params[:hot_projects_section])
  end
end


