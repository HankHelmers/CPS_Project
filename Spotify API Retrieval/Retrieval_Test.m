api_Handler = Spotify_Handler();

%api_Handler.Request_Auth();
api_Handler.set_Auth_Code(post_auth_url);
api_Handler.get_Auth_Code()