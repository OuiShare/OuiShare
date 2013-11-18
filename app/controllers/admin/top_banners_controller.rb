class Admin::TopBannersController < ApplicationController
  inherit_resources

  def create
    params[:top_banner][:language] = Language.find(params[:top_banner][:language].to_i)

    create! { root_url }
  end

  protected
  def permitted_params
    params.permit(top_banner: [:title1, :text1, :title2, :text2, :language, :language_id])
  end
end

