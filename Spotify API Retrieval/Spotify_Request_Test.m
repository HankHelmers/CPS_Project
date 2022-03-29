%% Testing the implementation of Spotify API
% Connecting Application to Spotify API & Making request. 

clear; clc; 

handler = Spotify_Handler('name');
disp(handler.username);


client_id = "28ca2d3814414c08858c196d669a3838"; % Specific Application client id
redirect_uri = 'http://localhost/';
scope = 'user-read-private user-read-email';
response_type = 'code';

% spotify_url = "http://GET /playlist/?id=37i9dQZF1DX4Wsb4d7NKfP HTTP/1.1"
% spotify_url = strcat(spotify_url, "X-Rapidapi-Host: spotify23.p.rapidapi.com")
% spotify_url = strcat(spotify_url, "X-Rapidapi-Key: 91a5de44e4mshd40382508214f43p1fc36djsn3e75d9e497ec")
% spotify_url = strcat(spotify_url, "Host: spotify23.p.rapidapi.com")

% Authorization url
auth_url = "https://accounts.spotify.com/authorize?";
auth_url = strcat(auth_url, "client_id="+client_id);
auth_url = strcat(auth_url, "&redirect_uri="+redirect_uri);
auth_url = strcat(auth_url, "&response_type="+response_type);

% retrieve from api
data = web(auth_url, '-browser');

%http://localhost/?code=AQCzCu4w_egGRDoHhYSEai1_lVIm2amdEeuw0zyDKiVVy8PDvkDSJ7AMqG-0ii_dgn0GhGkfd3p3F_g2uvq_TZWh72mMWCpn6cPlxOtrzv7lKRyqMVhQVOSUI7lvZWQdrcYMy0O0fLuWNMzyVjoBd37_TGwj