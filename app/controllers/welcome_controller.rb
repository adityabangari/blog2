class WelcomeController < ApplicationController
  def index
  end

  def home
    @articles = Article.all
  end

  def show

    @article=Article.find(params[:format])
  end

 
end
