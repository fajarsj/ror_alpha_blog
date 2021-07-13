class ArticlesController < ApplicationController

    def show
        # @ mean convert it from this block of code variable to an instance that can be use in view
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

end