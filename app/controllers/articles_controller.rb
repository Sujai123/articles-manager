# frozen_string_literal: true

# This is the Articles Controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, only: %i[edit new]
  before_action :require_same_user, only: %i[edit update destroy]

  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article updated successfully'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article deleted successfully'
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def require_same_user
    return unless !is_current_user?(@article.user) && !current_user.admin?

    flash[:error] = 'You can only edit your own account'
    redirect_to @article
  end
end
