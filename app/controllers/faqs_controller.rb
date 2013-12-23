class FaqsController < ApplicationController
  def index
    @faq_page = @current_language.faq_page || FaqPage.new
  end
end
