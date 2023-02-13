class StaticPageController < ApplicationController
    def show
        respond_to do |format|
            format.html { redirect_to books_url()}
    end
end