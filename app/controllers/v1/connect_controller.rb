module V1
  class ConnectController < ApplicationController
    def start
      connect_instance = ConnectInstance.create(:user_id => @auth_user.id)
      ConnectOption.all().each do |o|
        if params[:options] && params[:options][o.id.to_s]
          connect_instance
            .connect_instance_option_values
            .create(:connect_option_id => params[:options][o.id.to_s].to_i)
        else
          i = o.connect_option_values.where(is_default: true).first || o.connect_option_values.first
          connect_instance
            .connect_instance_option_values
            .create(:connect_option_id => i.id)
        end
      end
      connect_instance.active = true
      connect_instance.save
      render json: {"id" => connect_instance[:id].to_i}
    end
    def move
      render json: {"error" => "invalid move"}, status: 403
    end
  end
end