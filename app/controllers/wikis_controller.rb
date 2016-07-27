class WikisController < ApplicationController
    
  before_action :require_sign_in, except: [:show, :index]
  
  def new
   @wiki = Wiki.new
  end
  
  def create
     #@wiki = Wiki.new
     #@wiki.title = params[:wiki][:title]
     #@wiki.body = params[:wiki][:body]
     @wiki = @wiki.build(post_params)
     @wiki.user = current_user

    if @wiki.save
       flash[:notice] = "Wiki was saved successfully."
       redirect_to @wiki
    else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
    end
  end
  
  def update
     @wiki = Wiki.find(params[:id])
     #@wiki.title = params[:wiki][:title]
     #@wiki.body = params[:wiki][:body]
     @wiki.assign_attributes(post_params)
 
     if @wiki.save
       flash[:notice] = "Wiki was updated successfully."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :edit
     end
  end
  
  def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to wikis_path
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = Wiki.all
  end

  def show
     @wiki = Wiki.find(params[:id])
  end
  
  private
 
   def post_params
     params.require(:wiki).permit(:title, :body)
   end
end
