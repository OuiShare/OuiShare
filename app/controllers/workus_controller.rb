class WorkusController < ApplicationController
  include AutoHtml

  def index
    @workus_page = @current_language.workus_page || WorkusPage.new
    @services = @current_language.services || [Service.new]
    @workus_page.text = auto_html(@workus_page.text) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
  end
end
