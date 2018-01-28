class CommentsController < ApplicationController

	  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    @article = Article.find(params[:article_id])
    flash.notice = "Comment for '#{@article.title}' by '#{@comment.author_name}' added!"
    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body, :article_id)
  end
 
end
