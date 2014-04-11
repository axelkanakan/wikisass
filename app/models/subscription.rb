class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  attr_accessible :email, :stripe_customer_token
 
end
