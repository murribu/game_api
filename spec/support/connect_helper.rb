module ConnectHelper
  def retrieve_connect_instance_id(user_auth_token)
    post_with_token "/v1/connect/start", {'options' => {"1" => "4", "2" => "7", "3" => "7", "4" => "1"}}, {'Authorization' => user_auth_token}
    JSON.parse(response.body)["id"]
  end
end