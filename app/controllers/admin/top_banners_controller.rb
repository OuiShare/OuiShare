class Admin::TopBannersController < ApplicationController
  inherit_resources

  def create
    create! { admin_home_path }
  end

  def edit
    edit! { admin_home_path }
  end

  protected
  def permitted_params
    params.permit(top_banner: [:title1, :text1, :title2, :text2, :language, :language_id])
  end
end

