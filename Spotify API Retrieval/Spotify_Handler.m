%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% Spotify_Handler class
% Contols all interations between Spotify's API and the UI, where the UI 
% can draw the information necessary from this class to populate the visuals 
% for the user. 
classdef Spotify_Handler 
    properties (Access = private)
        auth_url;
        auth_code; 
    end

    methods (Access = public)   
        % Object Constructor -
        % 
        function obj = Spotify_Handler()
    
             Spotify_Request_Test; 
             
        end

        % Getters & Setters
        function SetAuthUrl(new_url)
            auth_url = new_url;

        end
            
    end
end



