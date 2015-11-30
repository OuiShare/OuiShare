class WorkusController < ApplicationController
  include AutoHtml
  helper_method :clean_description
  def index
    @workus_page = @current_language.workus_page || WorkusPage.new
    @services = @current_language.services || [Service.new]
  end
end
