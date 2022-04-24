%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% SpotifyHandler class
% Contols all interations between Spotify's API (SpotifyAuthorization) and 
% the UI, where the UI can draw the information necessary from this class 
% to populate the visuals for the user. 
classdef SpotifyHandler 
    properties 
        authCode;
        data; 
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
            authCode = obj.authCode;
            %disp(obj.authCode)
        end 

        function setData(inputtedData) 
            obj.data = inputtedData;
            SpotifyHandler.plotEnergyValence(obj.data);
        end

        function plotEnergyValence(data)
            disp(data)
            valence = data.valence;
            energy = data.energy;

            disp(valence)
            disp(energy)

            %plot(energy,valence)
        end
    end
end



