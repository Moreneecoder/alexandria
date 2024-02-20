# app/controllers/books_controller.rb
class BooksController < ApplicationController
  def index
    # render json: { data: Book.all }
    books = paginate(Book.all).map do |book|
      FieldPicker.new(BookPresenter.new(book, params)).pick
    end

    # p books.size
  
    render json: { data: books }.to_json
  end
end