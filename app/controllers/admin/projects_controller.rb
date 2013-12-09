class Admin::ProjectsController < ApplicationController
  inherit_resources
  belongs_to :language
  actions :all

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
    params.permit(project: [:name, :resume, :image, :info, :join_us_text, :service1_image, :service1_link, :service1_title, :service2_image, :service2_link, :service2_title, :service3_image, :service3_link, :service3_title])
  end

  def build_resource
    @project = Language.find(params[:language_id]).build_project(permitted_params[:project])
  end

end
