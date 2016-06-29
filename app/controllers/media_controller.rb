class MediaController < ApplicationController
  include AutoHtml
  def index
    @cocreation_page = @current_language.cocreation_page || CocreationPage.new
    @cocreation_page.text = auto_html(@cocreation_page.text) { html_escape; image; youtube(:width => 400, :height => 250); md_link; simple_format }
    @cocreations = @current_language.cocreations
  end
end