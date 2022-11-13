class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def index
    @authors = Author.all
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)
   
    if @author.save
      redirect_to @author
    else
      render "new"
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name, :homepage)
    end
end
