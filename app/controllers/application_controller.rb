class ApplicationController < ActionController::API
  before_action :authenticate_user_from_token
  respond_to :json
  
  def authenticate_user_from_token
    auth_token_str = request.headers['Authorization']
    
    if auth_token_str
      authenticate_with_auth_token auth_token_str
    else
      authentication_error
    end
  end
  
  private
    def authenticate_with_auth_token auth_token_str
      auth_token = OauthAccessToken.where(token: auth_token_str).first
      if auth_token
        case auth_token.scope
        when 'master'
          true
        #Add more scopes when needed
        else
          authentication_error
        end
      else
        authentication_error
      end
    end
    
    def authentication_error
      render json: {error: 'unauthorized'}, status: 401
    end
end