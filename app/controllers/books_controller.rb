class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
    @authors = Author.all
  end
  
  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to books_path
    else
      render "new",status: :unprocessable_entity
    end
  end
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to books_path
    else
      render "edit",status: :unprocessable_entity
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "task succesfully deleted!"
  end

  private
def books_params
  params.require(:book).permit(:title, :content, :author_id)
end
end
