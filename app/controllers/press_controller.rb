class PressController < ApplicationController
  include AutoHtml
  def index
    @press_room_page = @current_language.press_room_page || PressRoomPage.new
    @press_room_page.main_text = auto_html(@press_room_page.main_text) { html_escape; image; youtube(:width => 400, :height => 250); md_link; simple_format }
    @press_room_page.text1 = auto_html(@press_room_page.text1) { html_escape; image; youtube(:width => 400, :height => 250); md_link; simple_format }
    @press_room_page.text2 = auto_html(@press_room_page.text2) { html_escape; image; youtube(:width => 400, :height => 250); md_link; simple_format }
    @press_room_page.text3 = auto_html(@press_room_page.text3) { html_escape; image; youtube(:width => 400, :height => 250); md_link; simple_format }
  end
end
