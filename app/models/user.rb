class User < ActiveRecord::Base
  has_many :posts
  attr_accessible :administrator, :moderator, :name, :poster
end
