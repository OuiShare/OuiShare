class GetinvolvedController < ApplicationController
  def index
    @get_involved_page = @current_language.get_involved_page || GetInvolvedPage.new
  end
end
