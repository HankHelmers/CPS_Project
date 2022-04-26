% USED TO TEST THE IMPLEMENTATION OF THE FUNCTIONS WITH THE OTHER PARTS OF
% THE PROGRAM.
% WILL BE DELETED AND UNNESSESSARY FOR THE FILE PRODUCT. 

[file,path] = uigetfile('*.csv');  %open a mat file
filename = fullfile(path, file);
data = readtable(filename);
data.valence = SpotifyHandler.normToRange(data.valence, 0, 1, -1, 1);
data.energy = SpotifyHandler.normToRange(data.energy, 0, 1, -1, 1);

SpotifyHandler.plotEnergyValence(data);

% handle if they don't input the correct file ***8

% disp('High Energy & High Valence')
% SpotifyHandler.getHappySongs();
% 
% disp('Low Energy & Low Valence')
% SpotifyHandler.getSadSongs();
% 
