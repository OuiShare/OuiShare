module Shared::BeautifulText

  extend ActiveSupport::Concern

  included do
    def self.beautiful_text_for(fields)
      auto_html_for(fields) do
        html_escape
        image
        google_map
        twitter
        youtube width: 640, height: 390
        vimeo width: 640, height: 390
        redcarpet markdown_options: { filter_html: true, no_links: true }
        link target: '_blank', data: { :"no-turbolink" => true }
      end
    end
  end

end
