class Tag < ActiveRecord::Base
  has_many :posts, :through => :posts_to_tag
  has_many :posts_to_tag

end
