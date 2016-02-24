class SnippetsController < ApplicationController
  before_action :user_authenticate!
  before_action :find_snippet, only: [:show,:edit,:update,:destroy]
  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new params_snippet
    @snippet.user = current_user
    if @snippet.save
      redirect_to root_path, notice: "snippet created"
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path, alert: "access deined" and return unless can? :edit, @snippet
  end

  def update
    redirect_to root_path, alert: "access deined" and return unless can? :update, @snippet
    if @snippet.update params_snippet
      redirect_to snippet_path(@snippet), notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, alert: "access deined" and return unless can? :destroy, @snippet
    kind = @snippet.kind_id
    @snippet.destroy
    redirect_to kind_path(kind)
  end

  private

  def find_snippet
    @snippet = Snippet.find params[:id]
  end

  def params_snippet
    params_snippet = params.require(:snippet).permit(:title,:work,:kind_id,:user_id)
  end
end
