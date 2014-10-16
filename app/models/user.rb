class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  attr_accessible :administrator, :moderator, :name, :poster, :password
end
