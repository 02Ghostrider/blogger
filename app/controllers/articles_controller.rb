class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end

	def show
		@comment = Comment.new
		@comments = Comment.all
	end

	def edit
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
	  @article.save
	  flash.notice = "Article '#{@article.title}' Created!"
		redirect_to article_path(@article)
	end

	def update
	  @article.update(article_params)
	  flash.notice = "Article '#{@article.title}' Updated!"
	  redirect_to article_path(@article)
	end

	def destroy
		@article.destroy
		flash.notice = "Article '#{@article.title}' Deleted!"
		redirect_to articles_path
	end

	private

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end

end
