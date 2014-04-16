class WikisController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
  	@wikis = Wiki.all
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new 
    authorize! :create, Wiki, message: "You need to sign up to create a new post"
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki = current_user.wikis.build(params[:wiki])
    authorize! :create, @wiki, message: "You need to be signed up to do that."  
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was and error saving the post. Please"
      render :new
   end
 end
  
  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You need to be signed up to do that."
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You need to be signed in to do that."
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

end
