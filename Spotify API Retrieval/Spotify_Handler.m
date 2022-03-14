%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

classdef Spotify_Handler 
    properties
        username;
    end

    methods (Access = public)   
        % Object Constructor -
        %   Input: Takes & sets a string for the user's username. 
        function obj = Spotify_Handler(usernameInput)
             obj.username = usernameInput; 
        end


    end
end




%%