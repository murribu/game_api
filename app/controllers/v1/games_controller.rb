module V1
  class GamesController < ApplicationController
    #POST /v1/games/:game_id/start
    #expect param[:options] = 
    # {
    #   '1' (option_id) => '2' (option_value_id)
    # }
    # The option_id must be in the game's (:game_id) options
    # The option_value_id must be in the option's option_values (otherwise its default will be chosen)
    def start
      game = Game.includes(options: [:option_values]).includes(:guessing_game_instances).find(params[:game_id])
      case game.type
      when "GuessingGame"
        game_instance = game.guessing_game_instances.includes(:guessing_game_instance_option_values).create(:user_id => @auth_user.id)
        game.options.each do |o|
          if params[:options] && params[:options][o.id.to_s]
            game_instance.guessing_game_instance_option_values.create(:option_value_id => params[:options][o.id.to_s].to_i)
          else
            i = o.option_values.where(is_default: true).first || o.option_values.first
            game_instance.guessing_game_instance_option_values.create(:option_value_id => i)
          end
          case o.name
          when "Highest Number"
            #todo
            puts i.to_json
          else
            raise "Unknown Game Option"
          end
        end
        #todo
        retVal = game_instance.to_json(:include => :guessing_game_instance_option_values)
      else
        raise "Invalid Game Type"
      end
      render json: retVal
    end
  end
end