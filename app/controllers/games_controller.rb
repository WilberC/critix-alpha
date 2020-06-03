class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @platforms = @game.platforms.map(&:name).join(', ')
    @genres = @game.genres.map(&:name).join(', ')
  end
end
