class BooksController < ApplicationController

    def index
        @books = Book.all
    end
     
    
    def show
        @book = Book.find(params[:id])
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to  @book
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        
        if @book.update(author_params)
          redirect_to @book
        else
        render :edit, status: :unprocessable_entity
        end
    end

    def create
        @author = Author.find(params[:author_id])
        @book = @author.book.create(author_params)
        redirect_to root_path
      end
    
      private
        def author_params
          params.require(:book).permit(:name, :price)
        end

end
