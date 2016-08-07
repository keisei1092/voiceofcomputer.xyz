# coding: utf-8

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :edit, :destroy]
  before_filter :basic_authentication, only: [:new, :edit]

  def index
    @article = Article.last
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    return render 'new' if @article.title == "" || @article.content == ""
    if @article.save
      redirect_to article_path(:id => @article)
    else
      return render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(:id => @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to article_path(:id => @article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def basic_authentication
    authenticate_or_request_with_http_basic do |user, pass|
      user == config.admin_user && pass == config.admin_pass
    end
  end
end
