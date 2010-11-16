class Post < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :topic
  
  validates_presence_of :message, :user_id, :topic_id
  
end
