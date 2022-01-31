class DatasController < ApplicationController
    def index
        #  binding.pry
         @data = Author.find(params[:id]).books
    end
end
