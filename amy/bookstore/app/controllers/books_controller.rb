class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    book = Book.create book_params
    redirect_to book
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find params[:id]
  end

  def show
    @book = Book.find params[:id]
  end

  def update
    book = Book.find params[:id]
    book.update book_params
    redirect_to book
  end

  def destroy
    book = Book.find params[:id]
    book.delete
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :year, :genre, :publisher, :image, :summary, :isbn, :author_id)
  end
end
