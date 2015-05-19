module GameHelper
  def retrieve_guessing_game_instance_id(user_auth_token)
    user_auth_token = retrieve_access_token
    post_with_token "/v1/guessing_games/1/start", {'options' => {'1' => '2'}}, {'Authorization' => user_auth_token}
    JSON.parse(response.body)[:id]
  end
end