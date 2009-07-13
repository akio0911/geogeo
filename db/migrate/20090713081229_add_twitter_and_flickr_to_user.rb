class AddTwitterAndFlickrToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_id, :string
    add_column :users, :flickr_id, :string
  end

  def self.down
    remove_column :users, :flickr_id
    remove_column :users, :twitter_id
  end
end
