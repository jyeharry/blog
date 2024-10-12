class ImagesController < ApplicationController
  def destroy
    @article = Article.find(params[:article_id])
    @img = @article.images.find(params[:id])
    @img.purge

    redirect_to edit_article_path(@article), status: :see_other
  end
end
