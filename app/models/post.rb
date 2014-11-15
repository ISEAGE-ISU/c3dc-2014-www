class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :summary, :title, :user, :user_id
  has_many :comments
end
