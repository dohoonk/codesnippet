class KindsController < ApplicationController
  before_action :user_authenticate!, except: [:index]
  def index
    @kinds = Kind.all
    @snippets = Snippet.all
  end

  def show
    @kind = Kind.where("language LIKE ?", params[:language])
    @snippets = Snippet.where("kind_id = ?", params[:id])
  end

end
