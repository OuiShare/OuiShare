class PressController < ApplicationController
  include AutoHtml
  helper_method :clean_description
  def index
    @press_room_page = @current_language.press_room_page || PressRoomPage.new
  end
end
