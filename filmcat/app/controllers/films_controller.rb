class FilmsController < ApplicationController
  def index
  	@films = Film.all
  end

  def show
  	@film = Film.find(params[:id])
  	@comment = Comment.new()
  end

  def like
  	@film = Film.find(params[:id])
  	@film.rating += 1
  	@film.save
  	redirect_to show_path
  end
end
