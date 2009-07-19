require 'open-uri'
require 'rss'
require "rexml/document"
class Photo < ActiveRecord::Base
  belongs_to :user

  def self.import_flickr
    User.find(:all).each do |u|
      url = u.flickr_feed_url

#       open(url) do | http |
#         response = http.read
#         rss_items = RSS::Parser.parse(response, false)
#         rss_items.items.each do  |rss_item|
#           unless Photo.find(:first, :conditions => ["url = ?", rss_item.link])
#             Photo.create(:url => rss_item.link, :user_id => u.id)
#           end
#         end
#       end

      xml = open("http://api.flickr.com/services/feeds/photos_public.gne?id=17653213@N05&amp;lang=en-us&amp;format=rss_200").read
      doc = REXML::Document.new xml
      doc.elements.each('/feed') do |feed|
        feed.elements.each('entry') do |entry|
          entry.elements.each('link') do |link|
            p link.attributes['href']
          end
        end
      end
    end
  end
end
