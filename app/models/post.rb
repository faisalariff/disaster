class Post < ActiveRecord::Base
  has_many :tags, :through => :posts_to_tag
  has_many :posts_to_tag
end
