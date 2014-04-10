class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user
  
  
  default_scope order('created_at DESC')
end
