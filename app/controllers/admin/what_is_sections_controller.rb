class Admin::WhatIsSectionsController < ApplicationController
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
    params.permit(what_is_section: [:title, :title1, :text1, :title2, :text2, :title3, :text3, :title4, :text4, :image1, :image2, :image3, :image4])
  end

  def build_resource
    @what_is_section = Language.find(params[:language_id]).build_what_is_section(permitted_params[:what_is_section])
  end
end


