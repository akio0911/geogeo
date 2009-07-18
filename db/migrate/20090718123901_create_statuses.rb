class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.float :latitude
      t.float :longitude
      t.string :url
      t.text :status_text

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
