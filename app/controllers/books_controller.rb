class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
     @book.save!
    redirect_to book_path(@book.id)
  end
  def show
  end

  def index
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
