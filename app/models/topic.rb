class Topic < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :subforum
  
  has_many :posts
  
  validates_presence_of :title, :descrpition, :user_id, :subforum_id
  
end
