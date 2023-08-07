class Api::V1::BooksController < ApplicationController
  def index
    library = Library.find(params[:library_id])
    books = library.books
    render json: books
  end

  def check_book_availability
    library = Library.find(params[:library_id])
    available_books = library.books.where(user_id: nil).pluck(:title)
    render json: available_books
  end
end
