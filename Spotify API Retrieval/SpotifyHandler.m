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
%         function RequestAuthentication()
%             SpotifyAuthorization.RequestAuthInAPI(); 
%         end
% 
%         % Getters & Setters
%         function authCode=setAuthCode(newPostAuthUrl)
%             obj.authCode = SpotifyAuthorization.ParsePostAuthUrl(newPostAuthUrl);
%             authCode = obj.authCode;
%             %disp(obj.authCode)
%         end 

        function plotEnergyValence(data)
            labels = data.name + ", " + data.artist;
            
            plot(data.valence, data.energy,'o')
            xlabel('valence')
            ylabel('energy')
            grid('on')
            labelpoints(data.valence, data.energy,labels)
        end

        function getHappySongs(data)   
            % calculate average between valence & energy values
            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'descend');
            
            SpotifyHandler.plotEnergyValence(data);
            
            % valenceZeroSortedByEnergy = sortrows(valenceGreaterThanZero, {'energy', 'valence'}, 'descend');
            
            disp(data(1:10,["name", "artist", 'ValenceEnergyAverage']))
        end

        function getSadSongs(data) 
            % calculate average between valence & energy values, sort -1 ->
            % 1
            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'ascend');
            
            SpotifyHandler.plotEnergyValence(data)
                        
            disp(data(1:10,["name", "artist", 'ValenceEnergyAverage']))
        end

        function new_data=normToRange(data, old_min, old_max, new_min, new_max) 
            new_data = ( (data - old_min)./(old_max - old_min) ).* (new_max - new_min) + new_min;
        end
    end
end



