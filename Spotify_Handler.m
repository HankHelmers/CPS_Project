%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

classdef Spotify_Handler 
    properties 
        inputted_username = '';
    end

    methods (Access = public)
        function retrieveUsernameFromApp (inputValue) 
            inputted_username = inputValue;
            disp(inputted_username);
        end
    end
end




%%