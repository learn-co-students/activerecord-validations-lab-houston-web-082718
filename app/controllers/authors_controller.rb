class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params(:name, :phone_number))
    @author.save
    if @author.valid?
    redirect_to @author
    else
      redirect_to new_author_path
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params(:name))
    redirect_to @author
  end

  private


# We pass the permitted fields in as *args;
# this keeps `author_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action
  def author_params(*args)
    params.require(:author).permit(*args)
  end
end
