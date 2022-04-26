% USED TO TEST THE IMPLEMENTATION OF THE FUNCTIONS WITH THE OTHER PARTS OF
% THE PROGRAM.
% WILL BE DELETED AND UNNESSESSARY FOR THE FILE PRODUCT. 

[file,path] = uigetfile('*.csv');  %open a mat file
filename = fullfile(path, file);
data = readtable(filename);
% Data Processing 
data.valence = SpotifyHandler.normToRange(data.valence, 0, 1, -1, 1);
data.energy = SpotifyHandler.normToRange(data.energy, 0, 1, -1, 1);

% ------ Recommendations

SpotifyHandler.plotEnergyValence(data);

SpotifyHandler.getCalmSongs(data);     % Relaxed
SpotifyHandler.getHappySongs(data);    % 
SpotifyHandler.getSadSongs(data);      % Sad
SpotifyHandler.getHypeSongs(data);     % Energetic

% handle if they don't input the correct file ***8

% disp('High Energy & High Valence')
% SpotifyHandler.getHappySongs();
% 
% disp('Low Energy & Low Valence')
% SpotifyHandler.getSadSongs();

