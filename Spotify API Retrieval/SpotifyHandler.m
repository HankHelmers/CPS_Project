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
            
            valence = SpotifyHandler.normToRange(data.valence)
            energy = SpotifyHandler.normToRange(data.energy)

            labels = data.name + ", " + data.artist;
            
            plot(valence,energy,'o')
            xlabel('valence')
            ylabel('energy')
            grid('on')
            labelpoints(valence,energy,labels)
        end

        function getHappySongs(data) 
            data.valence = SpotifyHandler.normToRange(data.valence);
            data.energy = SpotifyHandler.normToRange(data.energy);

            sortedDataByValence = sortrows(data, {'valence', 'energy'}, 'descend')
            
            cnt = 0;
            for i = 1:height(data)
                if(data.valence(i) > 0) 
                    cnt = cnt + 1;
                end
            end

            disp(cnt)
            
            % valenceGreaterThanZero = sortedDataByValence(1:cnt, :);
            % valenceZeroSortedByEnergy = sortrows(valenceGreaterThanZero, {'energy', 'valence'}, 'descend');

            disp(valenceZeroSortedByEnergy)
        end

        function new_data=normToRange(data) 
            old_min = 0;
            old_max = 1;
            new_min = -1;
            new_max = 1;
            new_data = ( (data - old_min)./(old_max - old_min) ).* (new_max - new_min) + new_min;
        end
    end
end



