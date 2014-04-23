class WikisController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    	@wikis = Wiki.paginate(page: params[:page], per_page: 10).visible_to(current_user)
  end

  def show
  	@wiki = Wiki.find(params[:id])
    @users = User.all_but(current_user)
    authorize! :read, @wiki, message: "You need to be premium to view this"
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

  def destroy
    @wiki = Wiki.find(params[:id])
    name = @wiki.title
    authorize! :destroy, @wiki, message: "You need to own the topic to delete it."
    if @wiki.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end    
  end
end
