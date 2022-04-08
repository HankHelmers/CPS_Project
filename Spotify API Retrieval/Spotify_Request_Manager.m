
%% Spotify_Request_Manager
% Manages all calls with the Spotify APIs
%
% 1. Manages authorization requests.
%
classdef Spotify_Request_Manager 
    properties (Access = private)
        auth_url;
        auth_code; 
    end

    methods (Access = public)   
        function obj = Spotify_Request_Manager()
             obj.username = usernameInput; 
             % retrieve info from spotify
             Spotify_Request_Test; 
             
        end

        % Getters & Setters
        function SetAuthUrl(new_url)
            auth_url = new_url;
            
        end
            
    end
end