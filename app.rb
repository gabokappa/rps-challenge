require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Fight < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    @game = Game.create(player_1)
    redirect '/play'
  end

  get '/play' do
    # @tool = params[:selection]
    erb :play
  end

  post '/game-result' do
    @tool = params[:choice]
    erb :result
  end

    run! if __FILE__ == $PROGRAM_NAME
  end
