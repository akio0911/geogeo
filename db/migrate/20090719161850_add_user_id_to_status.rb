class AddUserIdToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :user_id, :integer
  end

  def self.down
    remove_column :statuses, :user_id
  end
end
