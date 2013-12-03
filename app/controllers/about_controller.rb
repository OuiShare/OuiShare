class AboutController < ApplicationController
  def index
    @language = Language.where(slug: I18n.locale.to_s).first
    @about = @language.about || About.new
  end

  def mission
  end

  def vision
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

  def mission
  end

  def vision
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

  def mission
  end

  def vision
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

  def mission
  end

  def vision
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
