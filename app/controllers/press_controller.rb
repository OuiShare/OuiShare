class PressController < ApplicationController
  include AutoHtml
  def index
    @press_room_page = @current_language.press_room_page || PressRoomPage.new
  end
end
