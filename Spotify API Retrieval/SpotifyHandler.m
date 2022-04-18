%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% SpotifyHandler class
% Contols all interations between Spotify's API (SpotifyAuthorization) and 
% the UI, where the UI can draw the information necessary from this class 
% to populate the visuals for the user. 
classdef SpotifyHandler 
    properties 
        authCode;
    end
    
    methods (Access = public)   
        function obj = SpotifyHandler()
        end
    end

    % Methods Accessible from all SpotifyHandler 
    methods (Static) 
        function RequestAuthentication()
            SpotifyAuthorization.RequestAuthInAPI(); 
        end

        % Getters & Setters
        function authCode=setAuthCode(newPostAuthUrl)
            obj.authCode = SpotifyAuthorization.ParsePostAuthUrl(newPostAuthUrl);
            authCode = obj.auth_code;
            %disp(obj.auth_code)
        end 
    end
end



