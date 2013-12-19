class Admin::TakePartSectionsController < BaseController
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
    params.permit(take_part_section: [:main_title, :main_text, :link_text, :title1, :text1, :link1, :title2, :text2, :link2, :title3, :text3, :link_3, :image1, :image2, :image3])
  end

  def resource
    @take_part_section ||= TakePartSection.find(params[:id])
  end

  def build_resource
    @take_part_section = Language.find(params[:language_id]).build_take_part_section(permitted_params[:take_part_section])
  end
end


