require 'open-uri'
require 'rss'
class Photo < ActiveRecord::Base
  belongs_to :user
  def self.import_flickr
    url = "http://api.flickr.com/services/feeds/photos_public.gne?id=84889587@N00&lang=en-us&format=rss_200"
    open(url) do | http |
      response = http.read
      rss_items = RSS::Parser.parse(response, false)
      rss_items.items.each do  |rss_item|
        unless Photo.find(:first, :conditions => ["url = ?", rss_item.link])
          Photo.create(:value => rss_item.title , :description => rss_item.description, :link => rss_item.link, :pub_date => rss_item.pubDate.strftime("%Y%m%d %H%M%S"))
        end
      end
    end
  end
end
