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
            data(data.valence<0,:)=[]; % remove any songs with a negative valence
            data(data.energy<0, :)=[]; % remove any songs with a negative energy
            
            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'descend');
            
            disp('happy')
            SpotifyHandler.plotEnergyValence(data);
                       
            disp(data)
        end

        function getSadSongs(data) 
            % calculate average between valence & energy values, sort -1 ->
            % 1
            data(data.valence>0,:)=[]; % remove any songs with a positive valence
            data(data.energy>0, :)=[]; % remove any songs with a positive energy

            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'ascend'); % want the smallest values
            
            SpotifyHandler.plotEnergyValence(data);

            disp('sad')
            disp(data);
        end

        function getCalmSongs(data) 
            % calm songs must have high valence, but low energy (4th
            % quadrant) 
            % select all songs with a positive valence, and negative energy
            % data = sortrows(data, 'valence', 'ascend');
            
            data(data.valence<0,:)=[]; % remove any songs with negative valence
            data(data.energy>0, :)=[]; % remove any songs with a positive energy

            data.energy = data.energy.*-1;

            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'descend');

            disp('calm')
            disp(data)

           % disp(data(1:10,["name", "artist", 'ValenceEnergyAverage']))
        end

        function getHypeSongs(data) 
            % calm songs must have high valence, but low energy (4th
            % quadrant) 
            % select all songs with a positive valence, and negative energy
            % data = sortrows(data, 'valence', 'ascend');
            
            data(data.valence>0,:)=[]; % remove any songs with negative valence
            data(data.energy<0, :)=[]; % remove any songs with a positive energy

            data.valence = data.valence.*-1;

            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'descend');

            SpotifyHandler.plotEnergyValence(data);
            
            disp('hype')
            disp(data)

           % disp(data(1:10,["name", "artist", 'ValenceEnergyAverage']))
        end

        function new_data=normToRange(data, old_min, old_max, new_min, new_max) 
            new_data = ( (data - old_min)./(old_max - old_min) ).* (new_max - new_min) + new_min;
        end
    end
end



