%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% Spotify_Handler class
% Contols all interations between Spotify's API and the UI, where the UI 
% can draw the information necessary from this class to populate the visuals 
% for the user. 
classdef Spotify_Handler 
    properties 
        auth_code;
    end

    properties (Access = private)
        
        
    end
    
    methods (Access = public)   
        % Object Constructor -
        % 
        function obj = Spotify_Handler()
        end
    end

    methods (Static) 
        function Request_Auth()
            Spotify_Authorization.Request_Auth_In_API(); 
        end

        % Getters & Setters
        function set_Auth_Code(new_Post_Auth_Url)
            post_auth_url = new_Post_Auth_Url;
            obj.auth_code = Spotify_Authorization.Parse_Post_Auth_Url(post_auth_url);
        end 
    end
end



