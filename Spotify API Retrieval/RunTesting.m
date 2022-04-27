% USED TO TEST THE IMPLEMENTATION OF THE FUNCTIONS WITH THE OTHER PARTS OF
% THE PROGRAM.
% WILL BE DELETED AND UNNESSESSARY FOR THE FILE PRODUCT. 

[file,path] = uigetfile('*.csv');  %open a mat file
filename = fullfile(path, file);
data = readtable(filename);

exists = any(strcmp('valence', data.Properties.VariableNames))

if(exists == 0)
    disp('incorrect file type')
end

% Data Processing 
data.valence = DataHandler.normToRange(data.valence, 0, 1, -1, 1);
data.energy = DataHandler.normToRange(data.energy, 0, 1, -1, 1);

% ------ Recommendations

DataHandler.plotEnergyValence(data);

relaxedSongs = DataHandler.getRelaxedSongs(data);     % Relaxed
happySongs = DataHandler.getHappySongs(data);         % Happy
sadSongs = DataHandler.getSadSongs(data);             % Sad
dynamicSongs = DataHandler.getDynamicSongs(data);     % Dynamic

% handle if they don't input the correct file ***8


