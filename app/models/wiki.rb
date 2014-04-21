class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :private, :image
  belongs_to :user
  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true
  
  mount_uploader :image, ImageUploader

  def self.visible_to(user)
  	  if user.role == 'premium'
  	  	all
   	  else
   	  	where(private: false) 
   	  end

   end 
  

end
