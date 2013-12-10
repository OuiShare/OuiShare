class Admin::LanguagesController < ApplicationController
  inherit_resources

  def update
    update! { admin_languages_path }
  end

  def create
    create! { admin_languages_path }
  end

  protected
  def permitted_params
    params.permit(language: [:name, :english_name, :slug, :visible])
  end
end
