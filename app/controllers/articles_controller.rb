class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    # @ mean convert it from this block of code variable to an instance that can be use in view
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      # @article_path(@article) is basically redirect you to @article.id, and you can shortened to @article
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    # the "articles_" is get from Prefix when you run "rails routes --expanded"
    redirect_to articles_path
  end

  # private method need to placed in the bottom of a controller, otherwise it will not work or certain method
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end