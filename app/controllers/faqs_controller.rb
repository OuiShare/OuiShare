class FaqsController < ApplicationController
  def index
    @faq_page = @current_language.faq_page || FaqPage.new
    @faq_questions = @current_language.faq_questions || [FaqQuestion.new]
  end
end
