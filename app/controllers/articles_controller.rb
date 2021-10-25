class ArticlesController < ApplicationController
  def show
    #byebug
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new 
   @article = Article.new
  end
  
  def edit 
    #byebug
   @article = Article.find(params[:id])
  end

  def create 
    @article = Article.new(params.require(:article).permit(:title, :desciption))
     if @article.save
       flash[:notice] = "Article was created successfully."
       redirect_to @article
     else
      render 'new'
     end
  end

  def update 
    @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :desciption))
        flash[:notice] = "the article was updated."
        redirect_to @article
      else
        render 'edit'
      end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "the article was deleted"
    redirect_to articles_path()
  end

end