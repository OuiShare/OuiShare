class HomeController < ApplicationController
  require 'feedzirra'
  def index
    @feed = Feedzirra::Feed.fetch_and_parse('http://ouishare.net/feed')
  end
end
