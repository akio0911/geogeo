class AddFlickrFeedUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :flickr_feed_url, :string
  end

  def self.down
    remove_column :users, :flickr_feed_url
  end
end
