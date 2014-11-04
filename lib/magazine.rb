class Magazine
  class << self
    def fetch_last_posts(language)
      Rails.cache.fetch(language + 'blog_posts', expires_in: 10.minutes) do
        begin
          if language == 'en'
            feed = Feedjira::Feed.fetch_and_parse("http://magazine.ouishare.net/feed")
          else
            feed = Feedjira::Feed.fetch_and_parse("http://magazine.ouishare.net/#{language}/feed")
          end
          feed.entries
        rescue
          []
        end
      end
    end
  end
end
