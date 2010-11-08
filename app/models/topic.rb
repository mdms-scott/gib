class Topic < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :subforum
  
  has_many :posts
  
end
