require 'open-uri'
require 'rss'
require "rexml/document"
class Photo < ActiveRecord::Base
  belongs_to :user

#http://api.flickr.com/services/feeds/photos_public.gne?id=17653213@N05&lang=en-us&format=rss_200
#http://api.flickr.com/services/feeds/photos_public.gne?id=17653213@N05&lang=en-us&format=rss_200
  def self.import_flickr
    User.find(:all).each do |u|
#       url = u.flickr_feed_url
#       xml = open(url).read
#       doc = REXML::Document.new xml
#       doc.elements.each('/feed') do |feed|
#         feed.elements.each('entry') do |entry|
#           entry.elements.each('link') do |link|
#             if link.attributes['rel'] == "enclosure"
#               photo = Photo.new
#               photo.url = link.attributes['href']
#               photo.user_id = u.id
#               photo.save
#             end
#           end
#         end
#       end
      xml = open(u.flickr_feed_url).read
      doc = REXML::Document.new xml
      doc.elements.each('/rss') do |rss|
        rss.elements.each('channel') do |channel|
          channel.elements.each('item') do |item|
            photo = Photo.new
#            photo.user_name = account[:user_name]
            item.elements.each('media:content') do |media_content|
              photo.url = media_content.attributes["url"] 
            end
            item.elements.each('media:thumbnail') do |media_thumbnail|
              photo.url_thumbnail = media_thumbnail.attributes["url"] 
            end
#            item.elements.each('dc:date.Taken') do |taken|
#              photo.taken_at =  taken.text
#            end
            photo.user_id = u.id
            unless Photo.find(:first, :conditions => ["url = ?", photo.url])
              photo.save
            end
          end
        end
      end
    end
  end
end
