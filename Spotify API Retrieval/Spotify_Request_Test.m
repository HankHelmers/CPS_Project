%% Testing the implementation of Spotify API
% Connecting Application to Spotify API & Making request. 
import matlab.net.URI;                                      % shorten lib calls
import matlab.net.http.RequestMethod;
import matlab.net.http.RequestMessage;
import matlab.net.http.field.AuthorizationField;
import matlab.net.http.field.ContentTypeField;
import matlab.net.http.*
import matlab.net.http.field.*
import spotify.client.*;

%function Spotify_Request_Test
    clear; clc; 
    
    base_url = "https://accounts.spotify.com/authorize?";

    client_id = "28ca2d3814414c08858c196d669a3838"; % Specific Application client id
    redirect_uri = 'https://hankhelmers.github.io/CPS_Project/';
    scope = 'user-read-private user-read-email';
    response_type = 'code';                          % create URI obj
    
    % Authorization url
    auth_url = "https://accounts.spotify.com/authorize?";
    auth_url = strcat(auth_url, "client_id="+client_id);
    auth_url = strcat(auth_url, "&redirect_uri="+redirect_uri);
    auth_url = strcat(auth_url, "&response_type="+response_type);
    
    data = web(auth_url);

    %r = RequestMessage;
    %resp = send(r,'https://hankhelmers.github.io/CPS_Project/?code=AQDkK3AcQqCnoiV37f1Ied1DjOyEINjnzKB1HA-JO7c0HIyYL2VR0PGrbawMQiKkuquXUl7UlI19VaEvDp2jzxsOF_scEItkktas0voMUgc4p2q1W8i0Kx4a_i3KB0dB6AtRO_ruQWXCVto_9ZQLn_bqJ7soiGsYN_3rLO6nheky5_VREMdzi9IVlzQg0A');
    %disp(resp.url)
  

    % 
    % % retrieve from api
    % data = web(auth_url, '-browser');


%end
%http://localhost/?code=AQCzCu4w_egGRDoHhYSEai1_lVIm2amdEeuw0zyDKiVVy8PDvkDSJ7AMqG-0ii_dgn0GhGkfd3p3F_g2uvq_TZWh72mMWCpn6cPlxOtrzv7lKRyqMVhQVOSUI7lvZWQdrcYMy0O0fLuWNMzyVjoBd37_TGwj