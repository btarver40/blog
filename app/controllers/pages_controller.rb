class PagesController < ApplicationController
  def index
    #give me a bunch of this resource(what index is)
    @pages =Page.all #we can use this in the views erb template
  end
  #you do not need to put index at the end of the code
  #in rails it will call index unless you specify otherwise

  def show
    @page = Page.find(params[:id])
    #this is how we find every page by its id
  end

  def new #new brings back a form so we can create something
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save #after they save a page where do you want to send them?
      redirect_to page_path(@page) #so if they save and everythig is ok
    else
      render :new 
      #rendering back to new if the user doesnt do something correct
      #when they are filling out the form
    end 
  end

  private 
  def page_params
    params.require(:page).permit(:title, :body, :author)
  end 

end

