%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% Spotify_Handler class
% Contols all interations with Spotify's API, where the UI can draw the
% information necessary from this class to populate the visuals for the
% user. 
classdef Spotify_Handler 
    properties
        username; % spotify user's username
    end

    methods (Access = public)   
        % Object Constructor -
        %   Input: Takes & sets a string for the user's username. 
        function obj = Spotify_Handler(usernameInput)
             obj.username = usernameInput; 
             % retrieve info from spotify
             
             
        end
            
    end
end



