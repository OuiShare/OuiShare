class AboutController < ApplicationController
  include AutoHtml
  def index
    @about = @current_language.about || About.new
  end

  def mission
    @resource = @current_language.mission || Mission.new
    @list = @current_language.activities.order('created_at desc') || [Activity.new]
    @resource.text = auto_html(@resource.text) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
  end

  def vision
  end

  def history
    @timeline = @current_language.timeline || Timeline.new
  end

  def organization
  end

  def team
  end

  def advisory
  end

  def governance
    @resource = @current_language.governance_page || GovernancePage.new
    # @list = @current_language.activities.order('created_at desc') || [Activity.new]
    @resource.text = auto_html(@resource.text) { html_escape; image; youtube(:width => 400, :height => 250); link(:target => "_blank", :rel => "nofollow"); simple_format }
  end

end
