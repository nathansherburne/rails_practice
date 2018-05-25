require 'sinatra'
require 'erb'
require './sinatra/caesar_cypher'

class CaesarApp < Sinatra::Base
  helpers Sinatra::CaesarCypher

  helpers do
    def get_message(params)
      if params['digest'] && params['shift_factor']
        if params['type'] == 'encrypt'
          encrypt(params['digest'], params['shift_factor'].to_i)
        else
          decrypt(params['digest'], params['shift_factor'].to_i)
        end
      end
    end
  end

  get '/' do
    @message = get_message(params)
    erb :main
  end
end

