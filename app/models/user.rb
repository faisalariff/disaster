class User < ActiveRecord::Base
  has_many :posts

  validates_uniqueness_of :email
  validates :password, :email, :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :username, length: { minimum: 3 }

  def self.authenticate(username, password)
    # if username and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.find_by username: username
    if !user.nil?
      if user.password == password
        return user
      else
        return nil
      end
    end
  end
end