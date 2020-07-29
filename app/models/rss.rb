class Rss < ApplicationRecord

  def self.news
    require 'crack' # for xml and json
    require 'crack/json' # for just json
    require 'crack/xml' # for just xml
    url = "https://www.espn.com/espn/rss/nfl/news"
    xml = HTTParty.get(url).body
    data = Crack::XML.parse(xml)
  end

end