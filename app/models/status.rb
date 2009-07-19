require "rexml/document"
require "open-uri"

class Status < ActiveRecord::Base
  belongs_to :user

  def self.get_xml
    User.find(:all).each do |user|
      get_xml_page(user, 1)
    end
  end

  private
  def self.get_xml_page(user, page)
    xml = open("http://twitter.com/statuses/user_timeline/#{user.twitter_id}.xml?page=#{page}").read
    doc = REXML::Document.new xml
    doc.elements.each('/statuses') do |statuses|
      statuses.elements.each('status') do |status|
        status_id = status.elements['id'].text
         unless Status.find(:first, :conditions => ["status_id = ?", status_id])
           s = Status.new
           s.status_id = status.elements['id'].text
           s.status_created_at = status.elements['created_at'].text
           s.status_created_at += 9.hour
           s.user_location = status.elements['user/location'].text
           s.status_text = status.elements['text'].text
           s.user_id = user.id
           s.save
         end
      end
    end
  end
end
