class PagesController < ApplicationController
    def pagesindex
        redirect_to articles_path if loggedin
    end

    def about
    end
end
