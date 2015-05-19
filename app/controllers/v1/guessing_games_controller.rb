module V1
  class GuessingGamesController < ApplicationController
    #POST /v1/guessing_games/:guessing_game_id/start
    #expect param[:options] = 
    # {
    #   '1' (option_id) => '2' (option_value_id)
    # }
    # The option_id must be in the guessing_game's (:guessing_game_id) options
    # The option_value_id must be in the option's option_values (otherwise its default will be chosen)
    def start
      guessing_game = GuessingGame.includes(guessing_game_options: [:guessing_game_option_values]).includes(:guessing_game_instances).find(params[:guessing_game_id])
      guessing_game_instance = guessing_game.guessing_game_instances
          .includes(:guessing_game_instance_option_values)
          .create(:user_id => @auth_user.id)
      guessing_game.guessing_game_options.each do |o|
        if params[:options] && params[:options][o.id.to_s]
          guessing_game_instance.guessing_game_instance_option_values.create(:guessing_game_option_value_id => params[:options][o.id.to_s].to_i)
        else
          i = o.guessing_game_option_values.where(is_default: true).first || o.guessing_game_option_values.first
          guessing_game_instance.guessing_game_instance_option_values.create(:guessing_game_option_value_id => i.id)
        end
      end
      v = GuessingGameOptionValue.find(guessing_game_instance.guessing_game_instance_option_values.first[:guessing_game_option_value_id]).value.to_i
      guessing_game_instance.answer = rand(0..v)
      guessing_game_instance.save
      render json: {"id" => guessing_game_instance[:id].to_i}
    end
  end
end