class SubscriptionsController < ApplicationController
  def new
  	@subscription = Subscription.new
  end

  def create
    @subscription = current_user.build_subscription(params[:subscription])    
    if @subscription.save_with_payment
       current_user.update_attribute(:role)
       redirect_to root_path, :notice => "Thank you for subscribing!"
    else
      flash[:alert] = "Error"
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
  
  def destroy
  end
end
