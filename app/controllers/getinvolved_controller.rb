class GetinvolvedController < ApplicationController
	helper_method :clean_description
  def index
    @get_involved_page = @current_language.get_involved_page || GetInvolvedPage.new
  end
end
