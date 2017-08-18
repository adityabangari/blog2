class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "adi", password: "adi", except: [:index]

  def index
    @articles = Article.all
  end


	def new
    @article= Article.new
  end

	def edit
	@article=Article.find(params[:id])
	end

	
	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		if(@article.save)
			redirect_to @article
		else
		render 'new'
		end	
	end


	def update
		@article = Article.find(params[:id])
 
  if @article.update(article_params)
			redirect_to @article
		else
		 render 'edit'
		end	
	end



	def show
		@article=Article.find(params[:id])
		@reply = Reply.new
	end



	def destroy
  		@article = Article.find(params[:id])
  		@article.destroy
 
  		redirect_to articles_path
	end


	private
  		def article_params
    		params.require(:article).permit(:title, :text)
  		end

	before_action :authenticate_user ,:only => [:index, :new, :show, :edit, :create, :update, :destroy]
  before_action :save_login_state, :only => [:login, :login_attempt]
end