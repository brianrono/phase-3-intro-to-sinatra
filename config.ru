require 'sinatra'

class App < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in  stew</p>"
  end

  get '/dice' do
    dice_roll = rand(1..6)
    # "<p>You rolled a #{dice_roll}</p>"
    { dice_roll: dice_roll }.to_json
  end

  get '/add/1/2' do
    sum = 1 + 2
    { result: sum }.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end
end

run App
