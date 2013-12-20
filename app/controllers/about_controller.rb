class AboutController < ApplicationController
  def index
    @about = @current_language.about || About.new
  end

  def mission
  end

  def vision
  end

  def history
  end

  def organization
  end

  def team
  end

  def advisory
  end

end
