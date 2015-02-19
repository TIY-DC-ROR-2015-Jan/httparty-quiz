class Post < ActiveRecord::Base
  validates_presence_of :user, :number
  validates_uniqueness_of :user
end
