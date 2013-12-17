class Admin::PartnersController < ApplicationController
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
    params.permit(partner: [:partner1, :partner2, :partner3, :partner4, :partner5, :partner6, :partner7])
  end

  def resource
    @partner ||= Partner.find(params[:id])
  end

  def build_resource
    @partner = Language.find(params[:language_id]).build_partner(permitted_params[:partner])
  end

end
