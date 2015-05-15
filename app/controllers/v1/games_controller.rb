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
      game = Game.includes(options: [:option_values]).includes(:game_instances).find(params[:game_id])
      game_instance = game.game_instances.includes(:game_instance_option_values).create(:user_id => @auth_user.id)
      game.options.each do |o|
        if params[:options] && params[:options][o.id.to_s]
          game_instance.game_instance_option_values.create(:option_value_id => params[:options][o.id.to_s].to_i)
        else
          i = o.option_values.where(is_default: true).first || o.option_values.first
          game_instance.game_instance_option_values.create(:option_value_id => i)
        end
      end
      render json: game_instance.to_json(:include => :game_instance_option_values)
    end
  end
end