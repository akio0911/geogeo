require 'open-uri'
require 'rss'
require "rexml/document"
class Photo < ActiveRecord::Base
  belongs_to :user

  def self.import_flickr
    User.find(:all).each do |u|
      url = u.flickr_feed_url
      xml = open(url).read
      doc = REXML::Document.new xml
      doc.elements.each('/feed') do |feed|
        feed.elements.each('entry') do |entry|
          entry.elements.each('link') do |link|
            if link.attributes['rel'] == "enclosure"
              photo = Photo.new
              photo.url = link.attributes['href']
              photo.user_id = u.id
              photo.save
            end
          end
        end
      end
    end
  end
end
