class Subforum < ActiveRecord::Base
  
  PRIVATE = ['0','1']
  
  has_many :topics
  validates_presence_of :title, :description, :is_private
  
end
