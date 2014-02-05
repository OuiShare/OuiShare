class WorkusController < ApplicationController
  include AutoHtml

  def index
    @workus_page = @current_language.workus_page || WorkusPage.new
    @services = @current_language.services || [Service.new]
  end
end
