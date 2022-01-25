class DatasController < ApplicationController
    def index
         @data = Book.find(params[:id]).author
         @data1 = Author.find(params[:id]).book
    end
end
