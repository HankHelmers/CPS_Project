% USED TO TEST THE IMPLEMENTATION OF THE FUNCTIONS WITH THE OTHER PARTS OF
% THE PROGRAM.
% WILL BE DELETED AND UNNESSESSARY FOR THE FILE PRODUCT. 

[file,path] = uigetfile('*.csv')  %open a mat file
filename = fullfile(path, file)
data = readtable(filename);
%SpotifyHandler.plotEnergyValence(data);

SpotifyHandler.getHappySongs(data);

%B = afterEach(A,fcn,n) 
%SpotifyAuthorization.RequestAuthInAPI();

%py.SpotifyInteract.getTokenRequest('AQBkEyHUp21Z-oh1p9-RdoZzeKR_qRNhYOV6qPc_IugNicsg0KkTgFubnpJYwujOpVX-oJb9YBAXOa8RQr9-HYpFOai_8NfcmQFX1FByHeT7qp3C1MdJbgRSWL6_LpC6CrndjbMolXo1VO-6snkqCi7cHGgBsLI7_6-3ixR0rDUbKRUcumdLExvk9a4WlQ')