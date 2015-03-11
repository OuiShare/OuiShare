module Admin
  class PressRoomPagesController < BaseController
    inherit_resources
    singleton_belongs_to :language
    actions :all, except: [:show, :index]

    before_filter :verify_admin

    def create
      build_resource
      @press_room_page = DefaultAttributes.new(@press_room_page).set([:image])
      if @press_room_page.save
        redirect_to admin_press_room_pages_path
      else
        redirect_to new_admin_language_press_room_page_path(params[:language_id])
      end
    end

    def update
      update! { admin_press_room_pages_path }
    end

    def destroy
      destroy! { admin_press_room_pages_path }
    end

    protected
    def permitted_params
      params.permit(press_room_page: [:main_text, :image, :title1, :text1, :title2, :text2, :title3, :text3])
    end

    def resource
      @press_room_page ||= PressRoomPage.find(params[:id])
    end

    def build_resource
      @press_room_page = Language.find(params[:language_id]).build_press_room_page(permitted_params[:press_room_page])
    end
  end
end
