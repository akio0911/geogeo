require 'open-uri'
require 'rss'
require "rexml/document"
class Photo < ActiveRecord::Base
  belongs_to :user

  def self.import_flickr
    User.find(:all).each do |u|
      xml = open(u.flickr_feed_url).read
      doc = REXML::Document.new xml
      doc.elements.each('/rss') do |rss|
        rss.elements.each('channel') do |channel|
          channel.elements.each('item') do |item|
            photo = Photo.new
            item.elements.each('media:content') do |media_content|
              photo.url = media_content.attributes["url"] 
            end
            item.elements.each('media:thumbnail') do |media_thumbnail|
              photo.url_thumbnail = media_thumbnail.attributes["url"] 
            end
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
