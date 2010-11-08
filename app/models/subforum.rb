class Subforum < ActiveRecord::Base
  
  PRIVATE = ['0','1']
  
  has_many :topics
  
end
