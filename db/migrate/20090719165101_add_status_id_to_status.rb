class AddStatusIdToStatus < ActiveRecord::Migration
  def self.up
    add_column :statuses, :status_id, :integer
    add_column :statuses, :status_created_at, :datetime
    add_column :statuses, :user_location, :string
  end

  def self.down
    remove_column :statuses, :user_location
    remove_column :statuses, :status_created_at
    remove_column :statuses, :status_id
  end
end
