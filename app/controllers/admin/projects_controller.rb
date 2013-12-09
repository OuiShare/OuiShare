class Admin::ProjectsController < ApplicationController
  inherit_resources
  belongs_to :language

  def create
    create! { admin_projects_path }
  end

  def update
    update! { admin_projects_path }
  end

  def destroy
    destroy! { admin_projects_path }
  end

  protected
  def permitted_params
    params.permit(project: [:name, :resume, :image, :info, :join_us_text, :service1_image, :service1_link, :service1_title, :service2_image, :service2_link, :service2_title, :service3_image, :service3_link, :service3_title, :text1, :text2])
  end

end
