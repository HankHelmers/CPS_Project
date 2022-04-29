%% CREATING A SAMPLE APP USING MATLAB APP DESIGNER

%% SpotifyHandler class
% Contols all interations between Spotify's API (SpotifyAuthorization) and 
% the UI, where the UI can draw the information necessary from this class 
% to populate the visuals for the user. 
classdef DataHandler 
    properties 
        authCode;
        data; 
    end
    
    methods (Access = public)   
        function obj = DataHandler()
        end
    end

    % Methods Accessible from all SpotifyHandler 
    methods (Static) 
        function plotEnergyValence(data)
            labels = data.name + ", " + data.artist;
            plot(data.valence, data.energy,'o')
            xlabel('valence')
            ylabel('energy')
            grid('on')
            labelpoints(data.valence, data.energy,labels)
        end
        
        function emotionData = getEmotionSongs(data, valenceMultiplier, energyMultiplier)
            % 1,  1 -> happy   ('high energy, high valence')
            % -1, 1 -> dynamic ('high energy, low valence')
            % 1, -1 -> relaxed ('low energy, high valence')
            % -1,-1 -> sad     ('low energy, low valence')
            
            % Get only the data within the quadrant of the chosen emotion
            if(valenceMultiplier > 0) 
                data(data.valence<0,:)=[]; 
            else 
                data(data.valence>0,:)=[];
            end

            if(energyMultiplier > 0)
                data(data.energy<0, :)=[];
            else
                data(data.energy>0, :)=[];
            end

            data.energy = data.energy.*energyMultiplier;
            data.valence = data.valence.*valenceMultiplier;

            % get the average energy valence
            data.ValenceEnergyAverage = (data.valence + data.energy)./2;
            data = sortrows(data, 'ValenceEnergyAverage', 'descend');
            
            emotionData = data;
        end

        function emotionData = getHappySongs(data) 
            disp('happy')
            emotionData = DataHandler.getEmotionSongs(data, 1, 1);
            %disp(emotionData);
        end

        function emotionData = getSadSongs(data) 
            disp('sad');
            emotionData=DataHandler.getEmotionSongs(data, -1, -1);
            %disp(emotionData);
        end

        function emotionData = getRelaxedSongs(data) 
            disp('relaxed');
            emotionData=DataHandler.getEmotionSongs(data, 1, -1);
            %disp(emotionData);
        end

        function emotionData = getDynamicSongs(data) 
            disp('dynamic');
            emotionData = DataHandler.getEmotionSongs(data, -1, 1);
            %disp(emotionData);
        end

        function new_data=normToRange(data, old_min, old_max, new_min, new_max) 
            new_data = ( (data - old_min)./(old_max - old_min) ).* (new_max - new_min) + new_min;
        end
    end
end



