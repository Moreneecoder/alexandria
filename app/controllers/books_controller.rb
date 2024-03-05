# app/controllers/books_controller.rb
class BooksController < ApplicationController
  def index
    # render json: { data: Book.all }
    # books = Book.order("#{params[:sort] || 'id'} #{params[:dir] || 'desc'}")

    # books = eager_load(filter(sort(paginate(Book.all)))).map do |book|
    # #   EmbedPicker.new(FieldPicker.new(BookPresenter.new(book, params)).pick).embed

    #   # This is a less verbose way of writing the above line. The FieldPicker.new.pick and EmbedPicker.new.embed calls are
    #   # extracted into the Base Presenter class as the fields and embeds methods respectively. The argument for the new method
    #   # in both classes will be the self keyword, which references the current instant object of the BookPresenter.
    #   BookPresenter.new(book, params).fields.embeds
    # end

    # books = orchestrate_query(Book.all).map do |book|
    #   BookPresenter.new(book, params).fields.embeds
    # end
  
    # render json: { data: books }.to_json

    books = orchestrate_query(Book.all)
    serializer = Alexandria::Serializer.new(data: books,
                                            params: params,
                                            actions: [:fields, :embeds])
    render json: serializer.to_json
  end
end