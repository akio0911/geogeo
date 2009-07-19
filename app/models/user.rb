class User < ActiveRecord::Base
  belongs_to :group
  has_many :photos
  has_many :statuses
end
